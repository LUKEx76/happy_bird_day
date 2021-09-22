import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_tile.dart';
import 'package:happy_bird_day/models/birthday.dart';

class BirthdayEventListView extends StatelessWidget {
  final List<Birthday>? events;

  const BirthdayEventListView({this.events});

  @override
  Widget build(BuildContext context) {
    if (events == null) {
      return Container();
    }
    return ListView.builder(
      //shrinkWrap: true,
      itemCount: events!.length,
      itemBuilder: (context, index) =>
          BirthdayListTile(birthday: events![index]),
    );
  }
}
