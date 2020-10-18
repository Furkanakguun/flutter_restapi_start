import 'package:flutter/material.dart';
import 'package:flutter_basic_api_project/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Start',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor:  Colors.teal,
      ),
      home: Home(),
    );
  }
}