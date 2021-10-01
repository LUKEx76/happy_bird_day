import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_tile.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:provider/provider.dart';

class BirthdayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Birthday> _birthdays = [];

    return Consumer<BirthdayChangeNotifier>(
      builder: (context, birthdayChangeNotifier, child) {
        return Consumer<DateChangeNotifier>(
          builder: (context, dateChangeNotifier, child) {
            _birthdays = getTodaysBirthdays(birthdayChangeNotifier.birthdays,
                dateChangeNotifier.selectedDate);
            return ListView.builder(
              //shrinkWrap: true,
              itemCount: _birthdays.length,
              itemBuilder: (context, index) => BirthdayListTile(
                birthday: _birthdays[index],
                selectedDate: dateChangeNotifier.selectedDate,
              ),
            );
          },
        );
      },
    );
  }
}
