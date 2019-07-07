import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/Utilities/Utilities.dart';
import 'package:weather_flutter/model/forecast.dart';
import 'package:weather_flutter/model/weather.dart';

import 'PredictionPage.dart';

class ForecastPage extends StatelessWidget {

  final Forecast forecast;

  ForecastPage({this.forecast});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = forecast.predictions.map((prediction) => _prediction(context, prediction)).toList();

    return Scaffold(body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        children: items,
      ),
     );
  }

  Widget _prediction(BuildContext context, Weather prediction) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PredictionPage(prediction: prediction)));
        },
        child: Container(width: 110, child: Column(children: <Widget>[
          Text(prediction.temperature.toString() + "°C", style: TextStyle(fontSize: 20, color: Colors.black87)),
          Image.asset('assets/${prediction.icon}.png', scale: 1),
          Text(Utilities.dateTime(prediction.dateTime), style: TextStyle(fontSize: 11, color: Colors.black87))
        ]
        )
        )
    );
  }

}
