import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/birthday_list_view.dart';
import 'package:happy_bird_day/loading.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    Map<DateTime, List<Birthday>> _birthdays = Map();

    //TODO: Streamify the List of Birthdays
    return StreamBuilder<List<Birthday>>(
      stream: DatabaseService().birthdayStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }

        _birthdays = parseBirthdays(snapshot.data);
        return Column(
          children: [
            BirthdayCalendar(
              birthdayMap: _birthdays,
              selectedDate: _selectedDate,
            ),
            Divider(),
            Expanded(
              child: BirthdayListView(
                birthdayMap: _birthdays,
                selectedDate: _selectedDate,
              ),
            ),
          ],
        );
      },
    );
  }
}
