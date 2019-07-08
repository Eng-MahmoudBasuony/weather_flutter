import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/Utilities/Utilities.dart';
import 'package:weather_flutter/model/weather.dart';
import 'package:weather_flutter/model/weather_result.dart';
import 'package:weather_flutter/model/weather_use_case.dart';
import 'package:weather_flutter/pages/ForecastPage.dart';

class HomeWeather extends StatefulWidget {
  final WeatherUseCase weatherUseCase;

  HomeWeather({Key key, this.weatherUseCase}) : super(key: key);

  @override
  _HomeWeatherState createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(child: Text("Weather the Day",style: TextStyle(color: Colors.black),)),
        ),
        body: Center(
          child: FutureBuilder<WeatherResult>(
            future: widget.weatherUseCase.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WeatherResult weatherResult = snapshot.data;
                return ContentPage(weather: weatherResult.weather,weatherResult: weatherResult,);
              } else if (snapshot.hasError) {
                return Text(
                  "${snapshot.error}",
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

class ContentPage extends StatefulWidget {
  final Weather weather;
  final  WeatherResult weatherResult;

  ContentPage({this.weather,this.weatherResult});

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {


  @override
  Widget build(BuildContext context) {

    double maxWindSpeed = 25.0;

    final wind = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: widget.weather.windSpeed / maxWindSpeed,
    );
    double maxPressure = 1058.0;
    final pressurec = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: widget.weather.pressure / maxPressure,
    );

    final humidityc = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: widget.weather.humidity / 100.0,
    );

    return Scaffold(
        body: Container(
          color:Colors.white70,
          //decoration:BoxDecoration(image: DecorationImage(image:AssetImage('assets/back.png'),fit: BoxFit.cover)),
          child: Column(
          children: <Widget>[

            //-------------Date----------------//
            SizedBox(
              height: 20,
            ),
            Text(Utilities.date(widget.weather.dateTime),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                )),
            SizedBox(
              height: 15,
            ),
    //--------------------City--------------------------//
            Text(
              widget.weather.name,
              style: TextStyle(
                fontSize: 34,
                color: Colors.black,
              ),
            ),

            //--------------temperature-------------//

            Text(widget.weather.temperature.toString() + "°C",
                style: TextStyle(
                  fontSize: 72,
                  color: Colors.black87,
                )),

           //--------------description-------------------//
            Hero(
                tag: 'hero',
                child:
                    Image.asset('assets/${widget.weather.icon}.png', width:100,height: 100,)),

            SizedBox(width: 9),

            Text(widget.weather.description,style: TextStyle(fontSize: 19,color: Colors.black87, )),

            SizedBox(height:30),

            //-------------------------Ather--------------------------------//
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //------------------------Wind----------------//
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Wind",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 12),
                      Text(widget.weather.windSpeed.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 10),
                      Text("m/s",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 2,
                        width: 80,
                        child: wind,
                      ),
                    ],
                  ),
                ),
                //----------------------Pressure-----------------//
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Pressure",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 12),
                      Text(widget.weather.pressure.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 10),
                      Text("hPa",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 2,
                        width: 80,
                        child: pressurec,
                      ),
                    ],
                  ),
                ),
                //------------------------Humidity--------------//
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("Humidity",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 12),
                      Text(widget.weather.humidity.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 10),
                      Text("%",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          )),
                      SizedBox(height: 7),
                      SizedBox(
                        height: 2,
                        width: 80,
                        child: humidityc,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
      ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("ForecastPage"),
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForecastPage(forecast: widget.weatherResult.forecast)));
        },
      ),
    );
  }
}
