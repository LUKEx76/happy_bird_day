import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BirthdayCalendar(),
    );
  }
}
