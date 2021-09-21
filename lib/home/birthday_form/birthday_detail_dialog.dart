import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_form/birthday_edit_dialog.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/stlyes.dart';

class BirthdayDetailDialog extends StatelessWidget {
  final Birthday birthday;

  BirthdayDetailDialog(this.birthday);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("🐦-Day"),
      content: SizedBox(
        width: 300,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              birthday.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              dateToDisplayString(
                  birthday.birthDay, birthday.birthMonth, birthday.birthYear),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              birthday.age > 0
                  ? "Turns " + birthday.age.toString() + " years old!"
                  : "",
              style: Theme.of(context).textTheme.overline,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            "Edit",
            style: TextStyle(color: colorPalette.warningColor),
          ),
          onPressed: () {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (val) => BirthdayEditDialog(birthday: birthday));
          },
        ),
        TextButton(
          child: Text(
            "Delete",
            style: TextStyle(color: colorPalette.errorColor),
          ),
          onPressed: () {
            print("Delete"); //TODO: Implement delete
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
