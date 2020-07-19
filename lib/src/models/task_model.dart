import 'package:flutter/material.dart';

class TaskModel with ChangeNotifier {
  bool _completed = false;
  String _type = 'personal';
  DateTime _date = DateTime.now();
  String _description = 'Mon - Fri';
  String _title = 'Morning run in the park';

  String get type => this._type;

  DateTime get date => this._date;

  String get title => this._title;

  bool get completed => this._completed;

  String get description => this._description;

  set type(String value) {
    this._type = value;
    notifyListeners();
  }

  set title(String value) {
    this._title = value;
    notifyListeners();
  }

  set date(DateTime value) {
    this._date = value;
    notifyListeners();
  }

  set completed(bool value) {
    this._completed = value;
    notifyListeners();
  }

  set description(String value) {
    this._description = value;
    notifyListeners();
  }
}
