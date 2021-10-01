import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_calendar.dart';
import 'package:happy_bird_day/home/birthday_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BirthdayCalendar(),
        Divider(),
        Expanded(child: BirthdayListView()),
      ],
    );

    // return Consumer<BirthdayChangeNotifier>(
    //   builder: (context, birthdayChangeNotifier, child) {
    //     birthdayChangeNotifier.initBirthdays();
    //     return Column(
    //       children: [
    //         BirthdayCalendar(birthdayMap: birthdayChangeNotifier.birthdays),
    //         Divider(),
    //         Expanded(
    //           child: BirthdayListView(
    //               birthdayMap: birthdayChangeNotifier.birthdays),
    //         ),
    //       ],
    //     );
    //   },
    // );

    // return FutureBuilder<List<Birthday>>(
    //   future: DatabaseService().getAllBirthdays(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.none ||
    //         snapshot.connectionState == ConnectionState.waiting) {
    //       return Loading();
    //     }

    //     return Column(
    //       children: [
    //         BirthdayCalendar(birthdayMap: birthdays),
    //         Divider(),
    //         Expanded(
    //           child: BirthdayListView(birthdayMap: birthdays),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
