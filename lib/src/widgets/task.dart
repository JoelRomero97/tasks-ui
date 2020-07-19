import 'package:flutter/material.dart';

import 'package:tasks_ui/src/utils/helpers.dart';
import 'package:tasks_ui/src/models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel task;

  Task(this.task);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 25),
        width: MediaQuery.of(context).size.width * 0.72,
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Text(
                    task.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (task.date.isBefore(now))
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                        task.date.hour == now.hour && isSameDay(task.date, now)
                            ? Icons.notifications_active
                            : Icons.check,
                        color: Color(task.date.hour == now.hour &&
                                task.date.day == now.day
                            ? 0xFF4042C9
                            : 0xFFA2A2A2),
                        size: 20),
                  ),
                if (task.date.isAfter(now))
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                        task.date.hour == now.hour && isSameDay(task.date, now)
                            ? Icons.notifications_active
                            : Icons.notifications_none,
                        color: Color(task.date.hour == now.hour &&
                                task.date.day == now.day
                            ? 0xFF4042C9
                            : 0xFFA2A2A2),
                        size: 20),
                  ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 5, color: Color(0xFFA2A2A2)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Text(
                    task.description,
                    style: TextStyle(
                      color: Color(0xFF47525E),
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.more_horiz,
                      color: Color(0xFF47525E), size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
