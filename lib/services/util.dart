import 'package:happy_bird_day/models/birthday.dart';

String dateToDisplayString(int day, int month,
    {int? year, String delimiter = "/", bool displayYear = true}) {
  String result = "";

  if (day < 10)
    result += "0" + day.toString();
  else
    result += day.toString();

  result += delimiter;

  if (month < 10)
    result += "0" + month.toString();
  else
    result += month.toString();

  result += delimiter;

  if (displayYear) {
    if (year != null)
      result += year.toString();
    else
      result += " - - - -";
  }

  return result;
}

List<Birthday> getBirthdaysFromMonthIndex(
    Map<DateTime, List<Birthday>> birthdays, int monthIndex) {
  List<Birthday> result = [];

  birthdays.forEach((key, value) {
    if (key.year == DateTime.now().year && key.month == monthIndex + 1)
      result.addAll(value);
  });
  result.sort((a, b) => a.birthDay.compareTo(b.birthDay));
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
