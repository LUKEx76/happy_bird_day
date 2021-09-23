import 'package:flutter/material.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:table_calendar/table_calendar.dart';

//TODO: Make Calender take Parameters from HomeScreen
class BirthdayCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final Map<DateTime, List<Birthday>>? birthdayMap;

  const BirthdayCalendar({this.birthdayMap, this.selectedDate});
  @override
  _BirthdayCalendarState createState() => _BirthdayCalendarState();
}

class _BirthdayCalendarState extends State<BirthdayCalendar> {
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<Birthday>> _birthdays = Map();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<CalendarFormat, String> _availableCalendarFormats = Map();

  @override
  void initState() {
    _availableCalendarFormats.putIfAbsent(_calendarFormat, () => "month");
    if (widget.selectedDate != null) {
      _selectedDate = widget.selectedDate!;
    }
    if (widget.birthdayMap != null) {
      _birthdays = widget.birthdayMap!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedDate);
    return TableCalendar(
      firstDay: DateTime.fromMillisecondsSinceEpoch(-2208992400000),
      lastDay: DateTime.fromMillisecondsSinceEpoch(4102441200000),
      focusedDay: _selectedDate,
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
        return getBirthdayEventsFromMap(_birthdays, day);
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDate, selectedDay)) {
          setState(() {
            _selectedDate = selectedDay;
          });
        }
      },
      // onFormatChanged: (format) {
      //   if (_calendarFormat != format) {
      //     setState(() {
      //       _calendarFormat = format;
      //     });
      //   }
      // },
      // onPageChanged: (focusedDay) {
      //   _selectedDate = focusedDay;
      // },
    );
  }
}
