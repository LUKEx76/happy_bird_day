import 'package:happy_bird_day/models/birthday.dart';

//TODO: Implement SQLite DB
//TODO: Make sure DB wont be deleted when reinstalling!
List<Birthday> createBirthdayMock() {
  List<Birthday> birthdayMocks = [];
  birthdayMocks.add(Birthday(
    name: "Luca",
    birthDay: 6,
    birthMonth: 11,
    birthYear: 1998,
    eventDate: DateTime.utc(2021, 11, 6),
  ));
  birthdayMocks.add(Birthday(
    name: "Brudi",
    birthDay: 13,
    birthMonth: 5,
    birthYear: 1995,
    eventDate: DateTime.utc(2021, 5, 13),
  ));
  birthdayMocks.add(Birthday(
    name: "Oli",
    birthDay: 13,
    birthMonth: 5,
    birthYear: 1999,
    eventDate: DateTime.utc(2021, 5, 13),
  ));
  birthdayMocks.add(Birthday(
    name: "Mama",
    birthDay: 15,
    birthMonth: 5,
    birthYear: 1969,
    eventDate: DateTime.utc(2021, 5, 15),
  ));
  birthdayMocks.add(Birthday(
    name: "Papa",
    birthDay: 2,
    birthMonth: 6,
    birthYear: 1971,
    eventDate: DateTime.utc(2021, 6, 2),
  ));
  birthdayMocks.add(Birthday(
    name: "Sabi",
    birthDay: 18,
    birthMonth: 9,
    birthYear: 1998,
    eventDate: DateTime.utc(2021, 9, 18),
  ));
  birthdayMocks.add(Birthday(
    name: "Test",
    birthDay: 15,
    birthMonth: 9,
    eventDate: DateTime.utc(2021, 9, 15),
  ));
  birthdayMocks.add(Birthday(
    name: "Test 2",
    birthDay: 15,
    birthMonth: 9,
    birthYear: 1970,
    eventDate: DateTime.utc(2021, 9, 15),
  ));

  return birthdayMocks;
}
