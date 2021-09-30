import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/create_birthday_fab.dart';
import 'package:happy_bird_day/home/home_screen.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateChangeNotifier(),
      child: BirdDayApp(),
    ),
  );
}

//TODO: Implement Notifications for todays BDays
//TODO: Add Animations
//TODO: Add AppIcon and PackageDomain
//TODO: Implement Export/Import
class BirdDayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
