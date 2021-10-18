import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/todays_birthday_list_view.dart';

class CalendarTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BirthdayCalendar(),
        Divider(),
        Expanded(child: TodaysBirthdayListView()),
      ],
    );
  }
}
