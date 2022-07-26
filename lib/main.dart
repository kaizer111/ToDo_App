import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine/Controller/DatetimeController.dart';
import 'package:routine/Providers/taskproviders.dart';
import 'package:routine/Screens/HomePage.dart';
import 'package:routine/Screens/NewTask.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DatetimeController(),),
          ChangeNotifierProvider(create: (context) => TaskProviders(),),
        ],
      child: MaterialApp(
        home: HomePage(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}
