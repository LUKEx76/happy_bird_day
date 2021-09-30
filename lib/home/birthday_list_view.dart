import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_tile.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:provider/provider.dart';

class BirthdayListView extends StatelessWidget {
  final Map<DateTime, List<Birthday>> birthdayMap;

  const BirthdayListView({required this.birthdayMap});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateChangeNotifier>(
      builder: (context, dateChangeNotifier, child) {
        List<Birthday> _birthdays = getBirthdayEventsFromMap(
            birthdayMap, dateChangeNotifier.selectedDate);

        return ListView.builder(
          //shrinkWrap: true,
          itemCount: _birthdays.length,
          itemBuilder: (context, index) =>
              BirthdayListTile(birthday: _birthdays[index]),
        );
      },
    );
  }
}
