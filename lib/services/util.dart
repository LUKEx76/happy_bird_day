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

Map<DateTime, List<Birthday>> parseBirthdays(List<Birthday>? birthdays) {
  Map<DateTime, List<Birthday>> birthdayMap = Map();

  if (birthdays == null || birthdays.isEmpty) {
    return birthdayMap;
  }

  for (var birthday in birthdays) {
    if (birthdayMap.containsKey(birthday.eventDate)) {
      birthdayMap.update(birthday.eventDate!, (value) {
        value.add(birthday);
        return value;
      });
    }
    birthdayMap.putIfAbsent(birthday.eventDate!, () => [birthday]);
  }

  return birthdayMap;
}

List<Birthday> getBirthdayEventsFromMap(
    Map<DateTime, List<Birthday>>? birthdayMap, DateTime? day) {
  if (birthdayMap == null || day == null || !birthdayMap.containsKey(day)) {
    return [];
  }
  return birthdayMap[day]!.toList();
}
