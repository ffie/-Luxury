// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_application_1/calendar/Screen/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalenderScreen(),
    );
  }
}
