import 'package:happy_bird_day/models/birthday.dart';

String dateToDisplayString(int day, int month, int? year) {
  if (day == 0 || month == 0) {
    return "";
  }

  String result = "";
  if (day < 10) {
    result += "0" + day.toString();
  } else {
    result += day.toString();
  }
  result += "/";
  if (month < 10) {
    result += "0" + month.toString();
  } else {
    result += month.toString();
  }
  if (year == null) {
    result += "/ - - - -";
    return result;
  }

  result += "/" + year.toString();
  return result;
}

Map<DateTime, List<Birthday>> parseBirthdays(List<Birthday> birthdays) {
  Map<DateTime, List<Birthday>> birthdayMocks = Map();

  for (var birthday in birthdays) {
    if (birthdayMocks.containsKey(birthday.eventDate)) {
      birthdayMocks.update(birthday.eventDate!, (value) {
        value.add(birthday);
        return value;
      });
    }
    birthdayMocks.putIfAbsent(birthday.eventDate!, () => [birthday]);
  }

  return birthdayMocks;
}
