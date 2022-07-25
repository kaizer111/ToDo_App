import 'package:flutter/material.dart';

class DatetimeController extends ChangeNotifier {
  DateTime _selecteddate = DateTime.now();

  DateTime get selecteddate => _selecteddate;

  set selecteddate(DateTime value) {
    _selecteddate = value;
    notifyListeners();
  }
}