import 'package:flutter/foundation.dart';

class DateChangeNotifier extends ChangeNotifier {
  late DateTime _selectedDate;

  DateChangeNotifier() {
    _selectedDate = DateTime.now();
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
