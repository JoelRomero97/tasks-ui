import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generic_page.dart';
import 'package:tasks_ui/src/utils/helpers.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tasks_ui/src/models/data_model.dart';
import 'package:tasks_ui/src/models/task_model.dart';
import 'package:tasks_ui/src/models/filters_model.dart';
import 'package:tasks_ui/src/widgets/custom_widgets.dart';

class SchedulePage extends StatelessWidget {
  Size _screenSize;
  DataModel dataModel;
  List<TaskModel> tasks;
  FiltersModel filtersModel;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    dataModel = Provider.of<DataModel>(context);
    filtersModel = Provider.of<FiltersModel>(context);
    tasks = dataModel.tasks
        .where((t) =>
            (filtersModel.type == 'all tasks'
                ? true
                : t.type == filtersModel.type) &&
            isSameDay(t.date, filtersModel.date))
        .toList();
    tasks.sort((a, b) => a.date.compareTo(b.date));
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: _buildBody(),
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
        DayFilter(day: filtersModel.date),
        Text(
          isSameDay(filtersModel.date, DateTime.now())
              ? 'TODAY\'S LIST'
              : '${filtersModel.date.day}\'S LIST',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          '${tasks.length} tasks',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  List<Widget> _buildBody() {
    List<Widget> result = [];
    if (tasks.length == 0) {
      result.add(SizedBox(height: 200));
      result.add(
        Text(
          'No tienes tareas :)',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
      );
    } else {
      result.add(TimelineTile(
        hasIndicator: false,
        topLineStyle: LineStyle(width: 0, color: Colors.transparent),
        alignment: TimelineAlign.manual,
        lineX: 0.2,
        rightChild: Text('Events', textAlign: TextAlign.center),
        leftChild: Text(
          'Time',
          textAlign: TextAlign.center,
        ),
      ));
      result.add(SizedBox(height: 10));
      for (var i = 0; i < tasks.length; i++) {
        final indicator = hasIndicator(tasks[i].date);
        result.add(TimelineTile(
          lineX: 0.2,
          hasIndicator: indicator,
          indicatorStyle: IndicatorStyle(
            width: 18,
            indicator: indicator ? CustomIndicator() : null,
          ),
          rightChild: Task(tasks[i]),
          alignment: TimelineAlign.manual,
          topLineStyle: LineStyle(width: 3, color: Color(0xFFF2F2F2)),
          leftChild: Text(
            '${tasks[i].date.hour.toString().padLeft(2, '0')}:${tasks[i].date.minute.toString().padLeft(2, '0')}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(indicator ? 0xFF4042C9 : 0xFFA2A2A2),
              fontSize: indicator ? 14 : 12,
            ),
          ),
        ));
      }
    }
    return result;
  }
}
