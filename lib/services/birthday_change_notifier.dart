import 'package:flutter/foundation.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';

class BirthdayChangeNotifier extends ChangeNotifier {
  Map<DateTime, List<Birthday>> _allBirthdays = Map();
  DatabaseService _databaseService = DatabaseService.instance;

  Map<DateTime, List<Birthday>> get allBirthdays => _allBirthdays;

  BirthdayChangeNotifier() {
    initBirthdays();
  }

  Future initBirthdays() async {
    _allBirthdays = _parseBirthdays(await _databaseService.getAllBirthdays());
    notifyListeners();
  }

  Future<List<Birthday>> getBirthdaysByDate(DateTime date) async {
    return await _databaseService.getBirthdaysByDate(date);
  }

  Future upsertBirthday(Birthday birthday) async {
    if (birthday.id == null) {
      await _databaseService.createBirthday(birthday);
    } else {
      await _databaseService.updateBirthday(birthday);
    }
    _allBirthdays = _parseBirthdays(await _databaseService.getAllBirthdays());
    notifyListeners();
  }

  Future deleteBirthday(Birthday birthday) async {
    int affectedRows = await _databaseService.deleteBirthday(birthday);
    if (affectedRows > 0) {
      _allBirthdays = _parseBirthdays(await _databaseService.getAllBirthdays());
      notifyListeners();
    }
  }

  Map<DateTime, List<Birthday>> _parseBirthdays(List<Birthday>? birthdays) {
    Map<DateTime, List<Birthday>> birthdayMap = Map();

    if (birthdays == null || birthdays.isEmpty) return birthdayMap;

    for (var birthday in birthdays) {
      if (birthday.eventDates == null || birthday.eventDates!.isEmpty) continue;

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
}
