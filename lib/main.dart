import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'Model/WeatherModel.dart';

//Future<WeatherModel> getWeatherModel(String lat, String lon) async {
//  final response = await http.get(
//      "https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=25104255dcd06b32b66a10cc6b811cd8&units=metric");
//
//  if (response.statusCode == 200) {
//    var result = json.decode(response.body);
//    var model = WeatherModel.fromJson(result);
//
//    return model;
//  } else {
//    throw Exception(
//        "==============Falid load Weather Information=============");
//  }
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather MB",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather MB"),

        ),
      ),
    );
  }
}
