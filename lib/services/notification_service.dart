import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initNotifications() async {
    flutterLocalNotificationsPlugin.initialize(InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: IOSInitializationSettings(),
    ));
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
    scheduleBirthdayNotifications();
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

  Future scheduleBirthdayNotifications() async {
    List<Birthday> todaysBirthdays = getTodaysBirthdays(
        parseBirthdays(await DatabaseService().getAllBirthdays()),
        tz.TZDateTime.now(tz.local));

    if (todaysBirthdays.isEmpty) {
      return;
    }
    String body = "";
    for (var birthday in todaysBirthdays) {
      body = body + "\nIt's " + birthday.name + "'s birthday.";
      if (birthday.age > 0) {
        body = body + " He/She turns " + birthday.age.toString() + ".";
      }
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      Random().nextInt(5000),
      "It's " + todaysBirthdays.length.toString() + " peoples birthday today!",
      body,
      _scheduleDaily(Time(8)),
      _notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }
}
