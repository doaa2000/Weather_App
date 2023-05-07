import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String locationName;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.locationName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var JsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        locationName: data['location']['name'],
        date: data['location']['localtime'],
        temp: JsonData['avgtemp_c'],
        maxTemp: JsonData['maxtemp_c'],
        minTemp: JsonData['mintemp_c'],
        weatherStateName: JsonData['condition']['text']);
  }

  String getImage() {
    if (weatherStateName == 'Partly cloudy')
      return 'assets/images/pcloudly.png';
    else if (weatherStateName == 'Sunny')
      return 'assets/images/sun.png';
    else if (weatherStateName == 'Patchy rain possible')
      return 'assets/images/rain2.png';
    else if (weatherStateName == 'Clear')
      return 'assets/images/clear.png';
    else if (weatherStateName == 'Moderate rain')
      return 'assets/images/rain2.png';

    return 'assets/images/clear.png';
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Partly cloudy')
      return Colors.blue;
    else if (weatherStateName == 'Sunny')
      return Colors.yellow;
    else if (weatherStateName == 'Patchy rain possible')
      return Colors.blueGrey;
    else if (weatherStateName == 'Clear')
      return Colors.blueGrey;
    else if (weatherStateName == 'Moderate rain')
      return Colors.blueGrey;
    else
      return Colors.blue;
  }
}
