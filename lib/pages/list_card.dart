import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_basic_api_project/models/list_data_json.dart';
import 'package:http/http.dart' as http;

class ListsWithJSON extends StatefulWidget {
  @override
  _ListsWithJSONState createState() => _ListsWithJSONState();
}

Future<List<ListDataJSON>> _getListsOfJSON() async {
  var data = await http.get(
      'https://raw.githubusercontent.com/Furkanakguun/API/main/list_data_user');
  var jsonData = json.decode(data.body);

  List<ListDataJSON> jsonList = [];

  for (var u in jsonData) {
    ListDataJSON listjson = ListDataJSON(
        u["index"], u["about"], u["name"], u["email"], u["picture"]);
    jsonList.add(listjson);
  }
  print(jsonList.length);

  return jsonList;
}

class _ListsWithJSONState extends State<ListsWithJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "JSON API CARD LIST",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getListsOfJSON(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].picture),
                    ),
                    title: Text(
                      snapshot.data[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(snapshot.data[index].email,
                        style: TextStyle(color: Colors.grey)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final ListDataJSON user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(user.name, style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Card(
            shadowColor: Colors.white,
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Kullanici Adi: "+user.name + " \n\n"+
                "Email: " +user.email  + " \n\n "+
                "About: " + " \n\n "+
                user.about,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
