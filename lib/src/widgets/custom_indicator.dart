import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFD2D2D2))),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF4042C9),
            border: Border.all(color: Color(0xFFD2D2D2))),
      ),
    );
  }
}
