import 'package:flutter/material.dart';

import 'generic_page.dart';
import 'package:tasks_ui/src/widgets/custom_widgets.dart';

class MyListPage extends StatelessWidget {
  Size _screenSize;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
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
          child: Wrap(
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              _buildTaskType('All Tasks', Icons.assignment, 20),
              _buildTaskType('Personal', Icons.person_outline, 15),
              _buildTaskType('Work', Icons.work, 10),
              _buildTaskType('Ideas', Icons.lightbulb_outline, 4),
              _buildTaskType('Art Work', Icons.audiotrack, 2),
              _buildTaskType('Urgently', Icons.priority_high, 1),
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
        DayFilter(day: DateTime.now(), selected: true),
        DayFilter(day: DateTime.now().add(Duration(days: 1))),
        DayFilter(day: DateTime.now().add(Duration(days: 2))),
        DayFilter(day: DateTime.now().add(Duration(days: 3))),
      ],
    );
  }
}
