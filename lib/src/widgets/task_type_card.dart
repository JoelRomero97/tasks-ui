import 'package:flutter/material.dart';

class TaskTypeCard extends StatelessWidget {
  final int tasks;
  final Icon icon;
  final String title;

  TaskTypeCard({
    this.tasks = 0,
    this.title = 'All Tasks',
    this.icon = const Icon(Icons.person, color: Color(0xFF4042C9)),
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.4,
      height: _size.height * 0.25,
      decoration: BoxDecoration(
        color: Color(0xFFF0F4F7),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD3E4FE),
            ),
            child: icon,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF7073A0),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$tasks items',
            style: TextStyle(
              color: Color(0xFF7073A0),
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
