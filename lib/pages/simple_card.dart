import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_basic_api_project/models/loadData.dart';
import 'package:http/http.dart' as http;

class SimpleCard extends StatefulWidget {
  @override
  _SimpleCardState createState() => _SimpleCardState();
}

Future<LoadData> apiCall() async {
  final response = await http.get(
      'https://raw.githubusercontent.com/Furkanakguun/API/main/user_api');
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
class _SimpleCardState extends State<SimpleCard> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "JSON API CARD",
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
                  ),),
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),      
    );
  }
}