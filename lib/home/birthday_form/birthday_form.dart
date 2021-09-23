import 'package:flutter/material.dart';
import 'package:happy_bird_day/models/birthday.dart';

class BirthdayForm extends StatefulWidget {
  final Birthday? birthday;

  BirthdayForm({this.birthday});

  @override
  _BirthdayFormState createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  Birthday _birthday = Birthday();

  @override
  void initState() {
    if (widget.birthday != null) {
      _birthday = widget.birthday!;
    }
    super.initState();
  }

  //TODO: Validate Input (Make DateInput robust)
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            initialValue: _birthday.name,
            maxLines: 1,
            decoration: InputDecoration(labelText: "Name"),
            onChanged: (value) => setState(
              () => _birthday.name = value,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  initialValue: _birthday.birthDay == 0
                      ? ""
                      : _birthday.birthDay.toString(),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "Day"),
                  onChanged: (value) => setState(
                      () => _birthday.birthDay = int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  initialValue: _birthday.birthMonth == 0
                      ? ""
                      : _birthday.birthMonth.toString(),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "Month"),
                  onChanged: (value) => setState(
                      () => _birthday.birthMonth = int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextFormField(
                  initialValue: _birthday.birthYear?.toString(),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: "Year (optional)"),
                  onChanged: (value) =>
                      setState(() => _birthday.birthYear = int.tryParse(value)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
