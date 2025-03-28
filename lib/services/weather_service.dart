import 'dart:convert';

import '../models/weatther_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService(this.apiKey);

  Future<Weather> getWeather(String lat, String long) async {
    final response = await http.get(
        Uri.parse('$BASE_URL?lat=$lat&lon=$long&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Faild to load weather data');
    }
  }
}
