import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_form/birthday_form.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/stlyes.dart';

class BirthdayEditDialog extends StatefulWidget {
  final Birthday? birthday;

  BirthdayEditDialog({this.birthday});

  @override
  _BirthdayEditDialogState createState() => _BirthdayEditDialogState();
}

class _BirthdayEditDialogState extends State<BirthdayEditDialog> {
  Birthday _birthday = Birthday();

  @override
  void initState() {
    if (widget.birthday != null) {
      _birthday = widget.birthday!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Birthday"),
      content: SizedBox(
        width: 300,
        height: 120,
        child: BirthdayForm(birthday: _birthday),
      ),
      actions: [
        TextButton(
          child: Text(
            "Save",
            style: TextStyle(color: colorPalette.successColor),
          ),
          onPressed: () {
            if (_birthday.id == null) {
              DatabaseService().createBirthday(_birthday);
            } else {
              DatabaseService().updateBirthday(_birthday);
            }
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
