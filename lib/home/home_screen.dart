import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/birthday_event_list_view.dart';
import 'package:happy_bird_day/loading.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';

class HomeScreen extends StatefulWidget {
  final DateTime? selectedDate;

  const HomeScreen({this.selectedDate});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  List<dynamic> _selectedEvents = [];
  Map<DateTime, List<dynamic>> _birthdays = Map();

  @override
  void initState() {
    _selectedEvents = _getEvents(_focusedDate);
    super.initState();
  }

  List<dynamic> _getEvents(DateTime day) {
    if (!_birthdays.containsKey(day)) {
      return [];
    }
    return _birthdays[day]!.toList();
  }

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
          return Column(
            children: [
              BirthdayCalendar(),
              Divider(),
              Expanded(
                child: BirthdayEventListView(selectedEvents: _selectedEvents),
              ),
            ],
          );
        });
  }
}
