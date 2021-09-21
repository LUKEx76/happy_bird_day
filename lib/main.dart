import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/create_birthday_fab.dart';
import 'package:happy_bird_day/home/home_screen.dart';
import 'package:happy_bird_day/stlyes.dart';

void main() {
  runApp(MyApp());
}

//TODO: Implement Notifications for todays BDays
class MyApp extends StatelessWidget {
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
          body: SafeArea(child: HomeScreen()),
          floatingActionButton: CreateBirthdayFAB(),
        ),
      ),
    );
  }
}
