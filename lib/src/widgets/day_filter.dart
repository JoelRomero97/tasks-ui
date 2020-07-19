import 'package:flutter/material.dart';

class DayFilter extends StatelessWidget {
  final DateTime day;
  final bool selected;
  final List<String> weekdays = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN'
  ];

  DayFilter({this.day, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width / 10,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Color(0xFF322FAB),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${day.day}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selected ? Color(0xFF322FAB) : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            weekdays[day.weekday - 1],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: selected ? Color(0xFF322FAB) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
