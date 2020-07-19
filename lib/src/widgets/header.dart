import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget icon;
  final String title;
  final Widget subHeader;

  Header(this.title, this.icon, this.subHeader);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                icon
              ],
            ),
            SizedBox(height: 20),
            subHeader,
          ],
        ),
      ),
    );
  }
}
