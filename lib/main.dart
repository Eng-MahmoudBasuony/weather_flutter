import 'package:flutter/material.dart';
import 'package:weather_flutter/weather_builder.dart';


void main() => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Current weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherBuilder().build()
    );
  }

}