import 'package:flutter/material.dart';

import 'package:tasks_ui/src/models/task_model.dart';

class DataModel with ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => this._tasks;

  set tasks(List<TaskModel> value) {
    this._tasks = value;
    notifyListeners();
  }
}
