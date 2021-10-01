import 'package:flutter/material.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BirthdayCalendar extends StatefulWidget {
  @override
  _BirthdayCalendarState createState() => _BirthdayCalendarState();
}

class _BirthdayCalendarState extends State<BirthdayCalendar> {
  late DateTime _selectedDate;
  Map<CalendarFormat, String> _calendarFormat = Map<CalendarFormat, String>();

  @override
  void initState() {
    _selectedDate = DateTime.now();
    _calendarFormat.putIfAbsent(CalendarFormat.month, () => "month");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BirthdayChangeNotifier>(
      builder: (context, birthdayChangeNotifier, child) {
        return TableCalendar(
          firstDay: DateTime.fromMillisecondsSinceEpoch(-2208992400000),
          lastDay: DateTime.fromMillisecondsSinceEpoch(4102441200000),
          focusedDay: _selectedDate,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: _calendarFormat,
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
            return getTodaysBirthdays(birthdayChangeNotifier.birthdays, day);
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDate, selectedDay)) {
              setState(() {
                _selectedDate = selectedDay;
                Provider.of<DateChangeNotifier>(context, listen: false)
                    .setDate(_selectedDate);
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
      },
    );
  }
}
