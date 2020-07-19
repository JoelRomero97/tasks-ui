import 'package:flutter/material.dart';
import 'package:tasks_ui/src/models/task_model.dart';
import 'package:tasks_ui/src/utils/helpers.dart';

import 'generic_page.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tasks_ui/src/widgets/custom_widgets.dart';

class SchedulePage extends StatelessWidget {
  Size _screenSize;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return GenericPage(
      title: 'SCHEDULE',
      subHeader: _buildSubHeader(),
      rightIcon: Icon(Icons.calendar_today, color: Colors.white),
      customChild: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 15, left: _screenSize.width * 0.03),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TimelineTile(
                hasIndicator: false,
                topLineStyle: LineStyle(width: 0, color: Colors.transparent),
                alignment: TimelineAlign.manual,
                lineX: 0.2,
                rightChild: Text('Events', textAlign: TextAlign.center),
                leftChild: Text(
                  'Time',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              TimelineTile(
                hasIndicator: false,
                topLineStyle: LineStyle(width: 3, color: Color(0xFFF2F2F2)),
                alignment: TimelineAlign.manual,
                lineX: 0.2,
                rightChild: Task(TaskModel()),
                leftChild: Text(
                  '10:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A2A2),
                    fontSize: 12,
                  ),
                ),
              ),
              TimelineTile(
                topLineStyle: LineStyle(width: 3, color: Color(0xFFF2F2F2)),
                alignment: TimelineAlign.manual,
                lineX: 0.2,
                hasIndicator: false,
                rightChild: Task(TaskModel()),
                leftChild: Text(
                  '10:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A2A2),
                    fontSize: 12,
                  ),
                ),
              ),
              TimelineTile(
                topLineStyle: LineStyle(width: 3, color: Color(0xFFF2F2F2)),
                alignment: TimelineAlign.manual,
                lineX: 0.2,
                indicatorStyle: IndicatorStyle(
                  width: 18,
                  indicator: CustomIndicator(),
                ),
                rightChild: Task(TaskModel()),
                leftChild: Text(
                  '10:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A2A2),
                    fontSize: 12,
                  ),
                ),
              ),
              TimelineTile(
                topLineStyle: LineStyle(width: 3, color: Color(0xFFF2F2F2)),
                alignment: TimelineAlign.manual,
                lineX: 0.2,
                hasIndicator: false,
                rightChild: Task(TaskModel()),
                leftChild: Text(
                  '10:00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFA2A2A2),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        DayFilter(day: DateTime.now(), selected: true),
        Text(
          isSameDay(DateTime.now().subtract(Duration(days: 1)), DateTime.now())
              ? 'TODAY\'S LIST'
              : '${DateTime.now().subtract(Duration(days: 1)).day}\'S LIST',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          '8 tasks',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
