import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/loadData.dart';

void main() {
  runApp(MyApp());
}

Future<LoadData> apiCall() async {
  final response = await http.get(
      'https://raw.githubusercontent.com/Furkanakguun/flutter_restapi_start/master/lib/models/api.json');
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json API'),
    );
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
        backgroundColor: Colors.orange,
        title: Text(
          "How to get data from JSON API",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Card(
                    shadowColor: Colors.white,
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "API CARD \n\n" +
                            "Kullanıcı Adı: ${snapshot.data.username} \n\n" +
                            "EPosta: ${snapshot.data.email} \n\n"
                                "Api URL: ${snapshot.data.url}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  )),
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Icon(Icons.home),
      ),
    );
  }
}
