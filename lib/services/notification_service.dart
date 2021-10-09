import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:workmanager/workmanager.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final String _notificationTaskName = "birthdayReminderTask";

  Future initNotifications() async {
    await flutterLocalNotificationsPlugin.initialize(InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: IOSInitializationSettings(),
    ));
  }

  void scheduleBirthdayNotificationTask() {
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
      "1",
      _notificationTaskName,
      frequency: Duration(days: 1),
      initialDelay: _initialDelay,
    );
  }

  final NotificationDetails _notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      //ongoing: true,
      styleInformation: BigTextStyleInformation(''),
    ),
    iOS: IOSNotificationDetails(),
  );

  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      if (task == _notificationTaskName) {
        await initNotifications();
        List<Birthday> todaysBirthdays = getTodaysBirthdays(
            parseBirthdays(await DatabaseService().getAllBirthdays()),
            DateTime.now());

        if (todaysBirthdays.isEmpty) {
          return Future.value(true);
        }
        String body = "";
        for (var birthday in todaysBirthdays) {
          body = body + "\nIt's " + birthday.name + "'s birthday.";
          if (birthday.getAge(DateTime.now().year) > 0) {
            body = body +
                " He/She turns " +
                birthday.getAge(DateTime.now().year).toString() +
                ".";
          }
        }
        await flutterLocalNotificationsPlugin.show(
          Random().nextInt(5000),
          "It's " +
              todaysBirthdays.length.toString() +
              " peoples birthday today!",
          body,
          _notificationDetails,
        );
      }
      return Future.value(true);
    });
  }
}
