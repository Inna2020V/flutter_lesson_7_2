import 'package:flutter/material.dart';
import 'package:flutter_lesson_7_2/components/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifs',
      home: HomePage(),
    );
  }
}
