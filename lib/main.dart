// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors
import 'timetable.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: TimeTable(),
    );
  }
}

void main(List<String> args) {
  runApp(App());
}
