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

String dateToDisplayStringMonthDayDot(int day, int month) {
  if (day == 0 || month == 0) {
    return "";
  }

  String result = "";
  if (day < 10) {
    result += "0" + day.toString();
  } else {
    result += day.toString();
  }
  result += ".";
  if (month < 10) {
    result += "0" + month.toString();
  } else {
    result += month.toString();
  }

  result += ".";
  return result;
}

List<Birthday> getTodaysBirthdays(
    Map<DateTime, List<Birthday>>? birthdayMap, DateTime? date) {
  if (birthdayMap == null || date == null) {
    return [];
  }
  DateTime dateWithoutTime = DateTime.utc(date.year, date.month, date.day);
  if (!birthdayMap.containsKey(dateWithoutTime)) {
    return [];
  }
  return birthdayMap[dateWithoutTime]!.toList();
}

Map<DateTime, List<Birthday>> parseBirthdays(List<Birthday>? birthdays) {
  Map<DateTime, List<Birthday>> birthdayMap = Map();

  if (birthdays == null || birthdays.isEmpty) {
    return birthdayMap;
  }

  for (var birthday in birthdays) {
    if (birthday.eventDates == null || birthday.eventDates!.isEmpty) {
      continue;
    }
    for (var eventDate in birthday.eventDates!) {
      if (birthdayMap.containsKey(eventDate)) {
        birthdayMap.update(eventDate, (value) {
          value.add(birthday);
          return value;
        });
      }
      birthdayMap.putIfAbsent(eventDate, () => [birthday]);
    }
  }

  return birthdayMap;
}

List<Birthday> getBirthdaysFromMonthIndex(
    Map<DateTime, List<Birthday>> birthdays, int monthIndex) {
  List<Birthday> result = [];

  birthdays.forEach((key, value) {
    print(key.toString() + value.toString());
    if (key.year == DateTime.now().year && key.month == monthIndex + 1)
      result.addAll(value);
  });
  return result;
}

Map<int, String> monthMap = {
  0: "January",
  1: "February",
  2: "March",
  3: "April",
  4: "May",
  5: "June",
  6: "July",
  7: "August",
  8: "September",
  9: "October",
  10: "November",
  11: "December",
};
