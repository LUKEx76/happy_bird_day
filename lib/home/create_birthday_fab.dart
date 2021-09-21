import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_form/birthday_edit_dialog.dart';

class CreateBirthdayFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => showDialog(
        context: context,
        builder: (val) => BirthdayEditDialog(),
      ),
    );
  }
}
