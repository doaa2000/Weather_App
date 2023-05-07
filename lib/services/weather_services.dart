import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '532234ef1567494c897134608230304';
  WeatherModel? model;
  Future<WeatherModel?> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      Map<String, dynamic> data = jsonDecode(response.body);
      throw Exception('uhu');
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    var JsonData = data['forecast']['forecastday'][0];
    model = WeatherModel.fromJson(data);

    return model;
  }
}
