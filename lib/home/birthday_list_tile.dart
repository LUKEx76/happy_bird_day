import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_form/birthday_detail_dialog.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/models/birthday.dart';

class BirthdayListTile extends StatelessWidget {
  final Birthday birthday;
  final DateTime? selectedDate;

  BirthdayListTile({required this.birthday, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    if (selectedDate != null) {
      date = selectedDate!;
    }
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (val) => BirthdayDetailDialog(
          birthday: birthday,
          selectedDate: date,
        ),
      ),
      child: ListTile(
        title: Text('🐦 ' + birthday.name),
        subtitle: birthday.getAge(date.year) > 0
            ? Text('Turns ' +
                birthday.getAge(date.year).toString() +
                ' years old!')
            : null,
        trailing: Text(dateToDisplayString(
            birthday.birthDay, birthday.birthMonth, birthday.birthYear)),
      ),
    );
  }
}
