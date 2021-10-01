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
