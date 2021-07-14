import 'dart:convert';

import 'package:flutter_cool_weather/src/models/index.dart';
import 'package:http/http.dart';

class LocationApi {
  LocationApi({required Client client, required String locationApiUrl})
      : _locationApiUrl = locationApiUrl,
        _client = client;

  final Client _client;

  final String _locationApiUrl;

  Future<Location> getLocation() async {
    final Response response = await _client.get(Uri.parse(_locationApiUrl));

    if (response.statusCode >= 300) {
      throw StateError('Failed to get location');
    }

    return Location.fromJson(jsonDecode(response.body));
  }
}
