import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bird_day/models/birthday.dart';

class BirthdayForm extends StatefulWidget {
  final Birthday? birthday;
  final GlobalKey<FormState> formKey;

  BirthdayForm({this.birthday, required this.formKey});

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            initialValue: _birthday.name,
            maxLines: 1,
            maxLength: 25,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(labelText: "Name"),
            validator: (input) {
              if (input == null || input.isEmpty) return "!";
              return null;
            },
            onChanged: (value) => setState(
              () => _birthday.name = value.trim(),
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
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Day",
                    counterText: " ",
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) return "!";
                    if (int.tryParse(input.trim()) == null) return "!";
                    int day = int.parse(input.trim());
                    if (day < 1 || day > 31) return "!";
                    return null;
                  },
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
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Month",
                    counterText: " ",
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) return "!";
                    if (int.tryParse(input.trim()) == null) return "!";
                    int month = int.parse(input.trim());
                    if (month < 1 || month > 12) return "!";
                    return null;
                  },
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
                  maxLength: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    labelText: "Year (optional)",
                    counterText: " ",
                  ),
                  validator: (input) {
                    if (input != null && input.isNotEmpty) {
                      if (int.tryParse(input.trim()) == null) return "!";
                      int year = int.parse(input.trim());
                      if (year < 1900 || year > DateTime.now().year) return "!";
                    }
                    return null;
                  },
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
