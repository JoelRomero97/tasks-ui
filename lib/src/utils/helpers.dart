import 'package:flutter/services.dart' as services;

void changeStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light);
}

bool isSameDay(DateTime day1, DateTime day2) {
  return day1.month == day2.month &&
      day1.year == day2.year &&
      day1.day == day2.day;
}
