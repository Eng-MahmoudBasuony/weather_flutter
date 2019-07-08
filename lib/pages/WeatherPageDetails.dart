import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_flutter/Utilities/Utilities.dart';
import 'package:weather_flutter/model/weather.dart';

class WeatherPage extends StatefulWidget {

  final Weather weather;

  WeatherPage({this.weather});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {


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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Day "+Utilities.dateTime(widget.weather.dateTime),
            style: TextStyle(
                fontSize: 25,
                color: Colors.indigo,
                fontWeight:FontWeight.bold
            )),
        ),),
      body: Container(
        color:Colors.white70,
        //decoration:BoxDecoration(image: DecorationImage(image:AssetImage('assets/back.png'),fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[


            SizedBox(height: 25,),
            //--------------temperature-------------//

            Text(widget.weather.temperature.toString() + "°C",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                )),
            SizedBox(height: 20,),
            //--------------Image-------------------//
            Hero(
                tag: 'hero',
                child:
                Image.asset('assets/${widget.weather.icon}.png', width:200,height: 200,)),

            SizedBox(height: 10),
            //--------------description-------------------//
            Text(widget.weather.description,style: TextStyle(fontSize: 25,color: Colors.indigoAccent,
                fontWeight: FontWeight.w600 )),

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
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
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
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.green
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
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.green
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

    );
  }

}


