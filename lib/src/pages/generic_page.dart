import 'package:flutter/material.dart';

import 'package:tasks_ui/src/utils/helpers.dart';
import 'package:tasks_ui/src/widgets/custom_widgets.dart';

class GenericPage extends StatelessWidget {
  final String title;
  final Widget rightIcon;
  final Widget subHeader;
  final Widget customChild;

  GenericPage({
    @required this.title,
    @required this.rightIcon,
    @required this.subHeader,
    @required this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: Color(0xFF4042C9),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Color(0xFF4042C9),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Header(
            title,
            rightIcon,
            subHeader,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.81,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: customChild,
          ),
        ),
      ],
    );
  }
}
