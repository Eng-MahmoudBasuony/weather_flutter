import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/Utilities/Utilities.dart';
import 'package:weather_flutter/model/weather.dart';
import 'package:weather_flutter/model/weather_result.dart';
import 'package:weather_flutter/model/weather_use_case.dart';

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
          title: Text("Weather the Day"),
        ),
        body: Center(
          child: FutureBuilder<WeatherResult>(
            future: widget.weatherUseCase.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WeatherResult weatherResult = snapshot.data;
                return ContentPage(weather: weatherResult.weather);
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

class ContentPage extends StatelessWidget {
  final Weather weather;

  ContentPage({this.weather});

  @override
  Widget build(BuildContext context) {
/*    double maxWindSpeed = 25.0;
    final wind = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: weather.windSpeed / maxWindSpeed,
    );
    double maxPressure = 1058.0;
    final pressurec = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: weather.pressure / maxPressure,
    );
    final humidityc = LinearProgressIndicator(
      backgroundColor: Colors.white24,
      value: weather.humidity / 100.0,
    );
    Row other = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(children: <Widget>[
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
                    Text(weather.windSpeed.toString(),
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
                    Text(weather.pressure.toString(),
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
                    Text(weather.humidity.toString(),
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
      ],
    );
    Container container = Container(
      margin: EdgeInsets.all(0),
      child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            city,
            date ,
            temperature,
            description,
            other
          ],
        ),
      ),
    );

    */
    return Column(
      children: <Widget>[
        //-------City------------//
        Text(
          weather.name,
          style: TextStyle(
            fontSize: 34,
            color: Colors.black,
          ),
        ),
        //-------------Date----------------//
        Text(Utilities.date(weather.dateTime),
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
            )),

        //--------------temperature-------------//

        Text(weather.temperature.toString() + "°C",
            style: TextStyle(
              fontSize: 72,
              color: Colors.black87,
            )),

//--------------description-------------------//
        Hero(
            tag: 'hero',
            child: Image.asset('assets/${weather.icon}.png', scale: 0.7)),
        SizedBox(width: 9),
        Text(weather.description,
            style: TextStyle(
              fontSize: 19,
              color: Colors.black87,
            )),
      ],
    );
  }
}
