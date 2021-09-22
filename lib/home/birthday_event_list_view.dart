import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_tile.dart';

class BirthdayEventListView extends StatelessWidget {
  final List? selectedEvents;

  //TODO: no List dynamic
  const BirthdayEventListView({this.selectedEvents});

  @override
  Widget build(BuildContext context) {
    if (selectedEvents == null) {
      return Container();
    }
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: selectedEvents!.length,
      itemBuilder: (context, index) =>
          BirthdayListTile(birthday: selectedEvents![index]),
    );
  }
}
