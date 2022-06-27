import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class ApiClient {
  static const String apiKey = 'ffa06619eae04e12c0dd6700b7548389';
  static const String exclude = 'hourly';
  static const double lat = 48.5105805;
  static const double lon = 32.2656283;
  static const String city = 'Kropyvnytskyi';
  final Uri weatherUri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=$exclude&appid=$apiKey');

  Future<WeatherModel> getWeather() async {
    var client = http.Client();
    try {
      var response = await client.get(weatherUri);
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      var model = WeatherModel.fromJson(decodedResponse);
      return model;
    } finally {
      client.close();
    }
  }
}
