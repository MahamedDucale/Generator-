import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String insult = "";
  Widget build(BuildContext context){
    return new MaterialApp(home: new Scaffold(
      body:new Center(
        child: new Column(
          children: <Widget>[
            new Text(insult),
            new RaisedButton(onPressed: newInsult)
          ]
        )
      )
    ),title: "Insult Generator"    
    );
  }
  void newInsult()async{
    Response r = await get("https://evilinsult.com/generate_insult.php?lang=en&type=json");
    Map<String,dynamic> s = jsonDecode(r.body);
    insult = s["insult"];
  }
}