import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/WeatherModel.dart';

Future<WeatherModel> getWeatherModel(String lat, String lon) async {
  final response = await http.get(
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=25104255dcd06b32b66a10cc6b811cd8&units=metric");

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    print("=============${result.toString()}================");
    var model = WeatherModel.fromJson(result);

    return model;
  } else {
    throw Exception(
        "==============Falid load Weather Information=============");
  }
}

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
          title: Center(
            child: Text("Weather MB"),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: FutureBuilder<WeatherModel>(
              future: getWeatherModel("31.00333", "31.38166"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  WeatherModel model = snapshot.data;
                  //format Date
                  var fm = new DateFormat("HH:mm dd EEE MM yyyy");
                  var fm_hour = DateFormat.Hm();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //----------------Location-----------------//
                      Text(
                        "Weather in ${model.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      //-----------Create Row  Image and Temperature-----------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Image.network("https://openweathermap.org/img/wn/${model.weather[0].icon}.png"),
                          Text(
                            "${model.main.temp} °C",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          )
                        ],
                      ),
                      //---------------Date Time----------------//
                Text(
                 "${fm.format(new DateTime.fromMillisecondsSinceEpoch((model.dt*1000),isUtc: true))}",
                style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                 //-------------------Speed/Deg--------------------//
                 Text("wind(Speed/Deg) : ${model.wind.speed}/${model.wind.deg}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 //-----------------Pressure-----------//
                 Text("Pressure : ${model.main.pressure} hpa",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 //--------------------Humidity---------//
                 Text("Humidity : ${model.main.humidity} %",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 //-----------------Sunrise-------------//
                 Text("Sunrise : ${fm_hour.format(DateTime.fromMillisecondsSinceEpoch((model.sys.sunrise*1000),isUtc: true))} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 //------------------sunset---------------//
                 Text("Sunrise : ${fm_hour.format(DateTime.fromMillisecondsSinceEpoch((model.sys.sunset*1000),isUtc: true))} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  //------------------
                 Text("GeoCode : [${model.coord.lat}/${model.coord.lon}]",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                    ],
                  );
                } else if (snapshot.hasError)
                  return Text("${snapshot.error}",
                      style: TextStyle(fontSize: 30, color: Colors.red));
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
