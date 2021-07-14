import 'dart:convert';

import 'package:flutter_cool_weather/src/models/index.dart';
import 'package:http/http.dart';

class WeatherApi {
  WeatherApi({required Client client, required String weatherApiUrl, required String weatherApiKey})
      : _client = client,
        _weatherApiUrl = weatherApiUrl,
        _weatherApiKey = weatherApiKey;

  final Client _client;

  final String _weatherApiUrl;

  final String _weatherApiKey;

  Future<Weather> getForecast(Location location) async {
    final Response response = await _client.get(Uri.parse(
        _weatherApiUrl + '?key=$_weatherApiKey&q=${location.city}%20${location.country}&days=1&aqi=no&alerts=no'));

    if (response.statusCode >= 300) {
      throw StateError('Failed to get weather');
    }

    final dynamic data = jsonDecode(response.body);

    return Weather((WeatherBuilder b) {
      b
        ..temperature = data['current']['temp_c'] as double
        ..weatherCondition = data['current']['condition']['text'] as String;
    });
  }
}
