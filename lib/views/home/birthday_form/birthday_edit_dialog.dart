import 'package:flutter/material.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/birthday_change_notifier.dart';
import 'package:happy_bird_day/services/date_change_notifier.dart';
import 'package:happy_bird_day/stlyes.dart';
import 'package:happy_bird_day/views/home/birthday_form/birthday_form.dart';
import 'package:provider/provider.dart';

class BirthdayEditDialog extends StatefulWidget {
  final Birthday? birthday;

  BirthdayEditDialog({this.birthday});

  @override
  _BirthdayEditDialogState createState() => _BirthdayEditDialogState();
}

class _BirthdayEditDialogState extends State<BirthdayEditDialog> {
  Birthday _birthday = Birthday();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.birthday != null) {
      _birthday = widget.birthday!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DateChangeNotifier>(
      builder: (context, dateChangeNotifier, child) {
        if (widget.birthday == null) {
          _birthday.birthDay = dateChangeNotifier.selectedDate.day;
          _birthday.birthMonth = dateChangeNotifier.selectedDate.month;
        }
        return AlertDialog(
          title: Text("New Birthday"),
          content: SizedBox(
            width: 300,
            height: 180,
            child: BirthdayForm(
              birthday: _birthday,
              formKey: _formKey,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "Save",
                style: TextStyle(color: colorPalette.successColor),
              ),
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  Provider.of<BirthdayChangeNotifier>(context, listen: false)
                      .upsertBirthday(_birthday);
                  Navigator.pop(context);
                }
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
      },
    );
  }
}
