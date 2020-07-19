import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tasks_ui/src/utils/helpers.dart';

import 'generic_page.dart';
import 'package:tasks_ui/src/models/data_model.dart';
import 'package:tasks_ui/src/models/task_model.dart';
import 'package:tasks_ui/src/models/filters_model.dart';
import 'package:tasks_ui/src/widgets/custom_widgets.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  Size _screenSize;
  DataModel dataModel;

  @override
  void initState() {
    super.initState();
    _initTasks();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    dataModel = Provider.of<DataModel>(context);
    final filtersModel = Provider.of<FiltersModel>(context);
    return GenericPage(
      title: 'MY LIST',
      subHeader: _buildDayFilter(),
      rightIcon: Icon(Icons.more_horiz, color: Colors.white),
      customChild: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
            top: 30,
            left: _screenSize.width * 0.07,
            right: _screenSize.width * 0.07),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Wrap(
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              _buildTaskType(
                  'All Tasks',
                  Icons.assignment,
                  dataModel.tasks
                      .where((t) => isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
              _buildTaskType(
                  'Personal',
                  Icons.person_outline,
                  dataModel.tasks
                      .where((t) =>
                          t.type == 'personal' &&
                          isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
              _buildTaskType(
                  'Work',
                  Icons.work,
                  dataModel.tasks
                      .where((t) =>
                          t.type == 'work' &&
                          isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
              _buildTaskType(
                  'Ideas',
                  Icons.lightbulb_outline,
                  dataModel.tasks
                      .where((t) =>
                          t.type == 'ideas' &&
                          isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
              _buildTaskType(
                  'Art Work',
                  Icons.audiotrack,
                  dataModel.tasks
                      .where((t) =>
                          t.type == 'art work' &&
                          isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
              _buildTaskType(
                  'Urgently',
                  Icons.priority_high,
                  dataModel.tasks
                      .where((t) =>
                          t.type == 'urgently' &&
                          isSameDay(t.date, filtersModel.date))
                      .toList()
                      .length),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskType(String title, IconData icon, int tasks) {
    return TaskTypeCard(
      title: title,
      icon: Icon(
        icon,
        color: Color(0xFF4042C9),
      ),
      tasks: tasks,
    );
  }

  Widget _buildDayFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        DayFilter(day: DateTime.now().subtract(Duration(days: 3))),
        DayFilter(day: DateTime.now().subtract(Duration(days: 2))),
        DayFilter(day: DateTime.now().subtract(Duration(days: 1))),
        DayFilter(day: DateTime.now()),
        DayFilter(day: DateTime.now().add(Duration(days: 1))),
        DayFilter(day: DateTime.now().add(Duration(days: 2))),
        DayFilter(day: DateTime.now().add(Duration(days: 3))),
      ],
    );
  }

  void _initTasks() {
    rootBundle.loadString('assets/tasks.json').then((value) {
      final aux = json.decode(value);
      aux.forEach((item) => dataModel.tasks.add(TaskModel()
        ..title = item['title']
        ..date = DateTime.parse(item['date'])
        ..description = item['description']
        ..type = item['type']));
      dataModel.tasks = dataModel.tasks;
    });
  }
}
