import 'package:flutter/material.dart';

class FiltersModel with ChangeNotifier {
  String _type = 'all';
  DateTime _date = DateTime.now();

  String get type => this._type;

  DateTime get date => this._date;

  set type(String value) {
    this._type = value;
    notifyListeners();
  }

  set date(DateTime value) {
    this._date = value;
    notifyListeners();
  }
}
