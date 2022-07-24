import 'package:flutter/material.dart';
import 'package:routine/Screens/HomePage.dart';
import 'package:routine/Screens/NewTask.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),debugShowCheckedModeBanner: false,
    );
  }
}
