import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:workmanager/workmanager.dart';

// Needs to be outside of the class so the isolate can access it
final String _notificationTaskName = "birthdayReminderTask";
final NotificationDetails _notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel description',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    styleInformation: BigTextStyleInformation(''),
  ),
  iOS: IOSNotificationDetails(),
);

class NotificationService {
  void scheduleBirthdayNotificationTask() {
    Workmanager().initialize(callbackDispatcher);

    Duration _initialDelay = Duration();
    DateTime now = DateTime.now();
    if (now.isAfter(DateTime.utc(now.year, now.month, now.day, 8))) {
      _initialDelay = Duration(
          days: 1,
          hours: 8 - now.hour,
          minutes: -now.minute,
          seconds: -now.second);
    } else {
      _initialDelay = Duration(
          days: 0,
          hours: 8 - now.hour,
          minutes: -now.minute,
          seconds: -now.second);
    }
    Workmanager().registerPeriodicTask(
      "9",
      _notificationTaskName,
      frequency: Duration(days: 1),
      initialDelay: _initialDelay,
    );
  }
}

void callbackDispatcher() {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Workmanager().executeTask((task, inputData) async {
    if (task == _notificationTaskName) {
      await flutterLocalNotificationsPlugin.initialize(InitializationSettings(
        //TODO: Set Android Notification Icon
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: IOSInitializationSettings(),
      ));

      List<Birthday> todaysBirthdays = getTodaysBirthdays(
          parseBirthdays(await DatabaseService().getAllBirthdays()),
          DateTime.now());

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
