import 'package:flutter/material.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:table_calendar/table_calendar.dart';

//TODO: Make Calender take Parameters from HomeScreen
class BirthdayCalendar extends StatefulWidget {
  final DateTime? selectedDate;

  const BirthdayCalendar({this.selectedDate});
  @override
  _BirthdayCalendarState createState() => _BirthdayCalendarState();
}

class _BirthdayCalendarState extends State<BirthdayCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<CalendarFormat, String> _availableCalendarFormats = Map();
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  List<dynamic> _selectedEvents = [];
  Map<DateTime, List<dynamic>> _birthdays = Map();

  @override
  void initState() {
    _availableCalendarFormats.putIfAbsent(_calendarFormat, () => "month");
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
    return TableCalendar(
      firstDay: DateTime.fromMillisecondsSinceEpoch(-2208992400000),
      lastDay: DateTime.fromMillisecondsSinceEpoch(4102441200000),
      focusedDay: _focusedDate,
      calendarFormat: _calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: _availableCalendarFormats,
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      sixWeekMonthsEnforced: true,
      weekendDays: [], //weekend days won't be greyed out
      daysOfWeekStyle:
          DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.grey)),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorPalette.primaryColor,
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorPalette.darkAccentColor,
        ),
        markerSize: 5,
        markerDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorPalette.lightAccentColor,
        ),
        outsideDaysVisible: false,
      ),
      eventLoader: (day) {
        return _getEvents(day);
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDate, selectedDay)) {
          setState(() {
            _selectedDate = selectedDay;
            _focusedDate = focusedDay;
            _selectedEvents = _getEvents(focusedDay);
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDate = focusedDay;
      },
    );
  }
}
