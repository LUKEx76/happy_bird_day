import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:workmanager/workmanager.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

// Needs to be outside of the class so the isolate can access it
final String _notificationTaskName = "birthdayNotificationTask";
final NotificationDetails _notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    'bird day channel',
    'daily birthday notification',
    channelDescription: 'notifies whos birthday it is today',
    icon: '@mipmap/ic_launcher',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    styleInformation: BigTextStyleInformation(''),
  ),
  iOS: IOSNotificationDetails(),
);

class NotificationService {
  void scheduleBirthdayNotificationTask() async {
    await Workmanager().initialize(callbackDispatcher);

    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));

    Duration _initialDelay =
        _nextInstanceOfTenAM().difference(tz.TZDateTime.now(tz.local));

    await Workmanager().cancelAll();
    await Workmanager().registerPeriodicTask(
      "23",
      _notificationTaskName,
      frequency: Duration(days: 1),
      initialDelay: _initialDelay,
    );
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}

void callbackDispatcher() {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Workmanager().executeTask((task, inputData) async {
    if (task == _notificationTaskName) {
      await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: IOSInitializationSettings(),
        ),
      );

      List<Birthday> todaysBirthdays =
          await BirthdayChangeNotifier().getBirthdaysByDate(DateTime.now());

      for (var birthday in todaysBirthdays) {
        String title = "It's " + birthday.name + "'s birthday today!";
        String? body;

        if (birthday.getAge(DateTime.now().year) > 0) {
          body = birthday.name +
              " turns " +
              birthday.getAge(DateTime.now().year).toString() +
              " years old.";
        }

        await flutterLocalNotificationsPlugin.show(
          Random().nextInt(5000),
          title,
          body,
          _notificationDetails,
        );
      }
    }
    return Future.value(true);
  });
}
