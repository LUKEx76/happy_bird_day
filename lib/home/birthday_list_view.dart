import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_tile.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/util.dart';

class BirthdayListView extends StatefulWidget {
  final Map<DateTime, List<Birthday>>? birthdayMap;
  final DateTime? selectedDate;

  const BirthdayListView({this.birthdayMap, this.selectedDate});
  @override
  _BirthdayListViewState createState() => _BirthdayListViewState();
}

class _BirthdayListViewState extends State<BirthdayListView> {
  List<Birthday> _birthdays = [];

  @override
  void initState() {
    _birthdays =
        getBirthdayEventsFromMap(widget.birthdayMap, widget.selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedDate);
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: _birthdays.length,
      itemBuilder: (context, index) =>
          BirthdayListTile(birthday: _birthdays[index]),
    );
  }
}
