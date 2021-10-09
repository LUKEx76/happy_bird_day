import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/create_birthday_fab.dart';
import 'package:happy_bird_day/home/home_screen.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/services/notification_service.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DateChangeNotifier()),
        ChangeNotifierProvider(create: (context) => BirthdayChangeNotifier()),
      ],
      child: BirdDayApp(),
    ),
  );
}

//TODO: ListView for Birthdays
//TODO: Add AppIcon and PackageDomain
//TODO: Fix Notifications
//TODO: Implement Export/Import
class BirdDayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Only schedule Notifications if they were not scheduled before!
    NotificationService().scheduleBirthdayNotificationTask();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Happy Birdday',
        theme: birdDayThemeData,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Happy 🐦-Day"),
          ),
          body: SafeArea(
            child: HomeScreen(),
          ),
          floatingActionButton: CreateBirthdayFAB(),
        ),
      ),
    );
  }
}
