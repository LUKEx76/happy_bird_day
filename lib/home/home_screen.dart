import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/birthday_list_view.dart';
import 'package:happy_bird_day/home/loading.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Birthday>> birthdays = Map();

    //TODO: Create a changemodel for Birthdays
    return FutureBuilder<List<Birthday>>(
      future: DatabaseService().getAllBirthdays(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        birthdays = parseBirthdays(snapshot.data);

        return Column(
          children: [
            BirthdayCalendar(birthdayMap: birthdays),
            Divider(),
            Expanded(
              child: BirthdayListView(birthdayMap: birthdays),
            ),
          ],
        );
      },
    );
  }
}
