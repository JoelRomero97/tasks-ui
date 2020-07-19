class TaskModel {
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

  set type(String value) => this._type = value;

  set title(String value) => this._title = value;

  set date(DateTime value) => this._date = value;

  set completed(bool value) => this._completed = value;

  set description(String value) => this._description = value;
}
