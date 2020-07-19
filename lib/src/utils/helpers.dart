import 'package:flutter/services.dart' as services;

void changeStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light);
}
