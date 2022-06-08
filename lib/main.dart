import 'package:flutter/material.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/services/notification_service.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:happy_bird_day/views/home/home_screen.dart';
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

//TODO: Implement Export/Import
//TODO: Create Splashscreen
//TODO: Introduce new theme
//TODO: Implement search
class BirdDayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: 'Happy BirdDay',
        theme: birdDayThemeData,
        home: HomeScreen(),
      ),
    );
  }
}
