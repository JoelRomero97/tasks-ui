import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tasks_ui/src/models/data_model.dart';
import 'package:tasks_ui/src/models/task_model.dart';
import 'package:tasks_ui/src/pages/my_list_page.dart';
import 'package:tasks_ui/src/pages/schedule_page.dart';
import 'package:tasks_ui/src/models/filters_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => new DataModel()),
      ChangeNotifierProvider(create: (_) => new FiltersModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks UI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'my-list',
      routes: {
        'my-list': (BuildContext context) => MyListPage(),
        'schedule': (BuildContext context) => SchedulePage(),
      },
    );
  }
}
