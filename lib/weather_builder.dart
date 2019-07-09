import 'package:http/http.dart' show Client;
import 'package:location_permissions/location_permissions.dart';
import 'package:location/location.dart';

import 'package:weather_flutter/Utilities/Utilities.dart';
import 'package:weather_flutter/model/weather_use_case.dart';
import 'package:weather_flutter/pages/HomeWeather.dart';
import 'package:weather_flutter/service/current_weather_service.dart';
import 'package:weather_flutter/service/forecast_weather_service.dart';


class WeatherBuilder {

  HomeWeather build()
  {
    Location location = Location();

    Client client = Client();

    OpenWeatherCurrentService weatherService = OpenWeatherCurrentService(client, Utilities.endpoint, Utilities.appId);
    OpenWeatherForecastService forecastService = OpenWeatherForecastService(client, Utilities.endpoint, Utilities.appId);
    WeatherUseCase useCase = WeatherUseCase(location, weatherService, forecastService);
    
    return HomeWeather(weatherUseCase: useCase);
  }

}
