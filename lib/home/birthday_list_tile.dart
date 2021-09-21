import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_form/birthday_detail_dialog.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/models/birthday.dart';

class BirthdayListTile extends StatelessWidget {
  final Birthday birthday;

  BirthdayListTile({required this.birthday});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (val) => BirthdayDetailDialog(birthday),
      ),
      child: ListTile(
        title: Text('🐦 ' + birthday.name),
        subtitle: birthday.age > 0
            ? Text('Turns ' + birthday.age.toString() + ' years old!')
            : null,
        trailing: Text(dateToDisplayString(
            birthday.birthDay, birthday.birthMonth, birthday.birthYear)),
      ),
    );
  }
}
