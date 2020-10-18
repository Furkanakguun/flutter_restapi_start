import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/loadData.dart';

void main() {
  runApp(MyApp());
}

Future<LoadData> apiCall() async{
  final response = await http.get();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
  
    );
  }
}
