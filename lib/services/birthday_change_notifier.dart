import 'package:flutter/foundation.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/db_service.dart';
import 'package:happy_bird_day/services/util.dart';

class BirthdayChangeNotifier extends ChangeNotifier {
  Map<DateTime, List<Birthday>> _birthdays = Map();

  Map<DateTime, List<Birthday>> get birthdays => _birthdays;

  BirthdayChangeNotifier() {
    initBirthdays();
  }

  Future initBirthdays() async {
    _birthdays = parseBirthdays(await DatabaseService().getAllBirthdays());
    notifyListeners();
  }

  Future upsertBirthday(Birthday birthday) async {
    if (birthday.id == null) {
      await DatabaseService().createBirthday(birthday);
    } else {
      await DatabaseService().updateBirthday(birthday);
    }
    _birthdays = parseBirthdays(await DatabaseService().getAllBirthdays());
    notifyListeners();
  }

  Future deleteBirthday(Birthday birthday) async {
    int affectedRows = await DatabaseService().deleteBirthday(birthday);
    if (affectedRows > 0) {
      _birthdays = parseBirthdays(await DatabaseService().getAllBirthdays());
      notifyListeners();
    }
  }
}
