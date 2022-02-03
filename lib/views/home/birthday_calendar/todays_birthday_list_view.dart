import 'package:flutter/material.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/views/home/birthday_calendar/birthday_list_tile.dart';
import 'package:provider/provider.dart';

class TodaysBirthdayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BirthdayChangeNotifier>(
      builder: (context, birthdayChangeNotifier, child) =>
          Consumer<DateChangeNotifier>(
        builder: (context, dateChangeNotifier, child) =>
            FutureBuilder<List<Birthday>>(
                future: birthdayChangeNotifier
                    .getBirthdaysByDate(dateChangeNotifier.selectedDate),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => BirthdayListTile(
                            birthday: snapshot.data![index],
                            selectedDate: dateChangeNotifier.selectedDate,
                          ),
                        )
                      : Container();
                }),
      ),
    );
  }
}
