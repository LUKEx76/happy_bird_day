import 'package:flutter/material.dart';
import 'package:happy_bird_day/views/home/birthday_calendar.dart';
import 'package:happy_bird_day/views/home/birthday_calendar/todays_birthday_list_view.dart';

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
