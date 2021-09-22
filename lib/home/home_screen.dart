import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/birthday_event_list_view.dart';
import 'package:happy_bird_day/loading.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';

class HomeScreen extends StatelessWidget {
  DateTime _selectedDate = DateTime.now();
  List<Birthday> _selectedEvents = [];
  Map<DateTime, List<Birthday>> _birthdays = Map();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Birthday>>(
        future: DatabaseService().getAllBirthdays(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          _birthdays = parseBirthdays(snapshot.data);
          _selectedEvents = getBirthdayEventsFromMap(_birthdays, _selectedDate);

          return Column(
            children: [
              BirthdayCalendar(),
              Divider(),
              Expanded(
                child: BirthdayEventListView(events: _selectedEvents),
              ),
            ],
          );
        });
  }
}
