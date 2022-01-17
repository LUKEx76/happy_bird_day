import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_month_card.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:provider/provider.dart';

class BirthdayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Birthday> _birthdays = [];

    return Consumer<BirthdayChangeNotifier>(
      builder: (context, birthdayChangeNotifier, child) {
        return ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            _birthdays = getBirthdaysFromMonthIndex(
                birthdayChangeNotifier.allBirthdays, index);
            return BirthdayMonthCard(
              birthdays: _birthdays,
              monthIndex: index,
            );
          },
        );
      },
    );
  }
}
