import 'package:flutter_cool_weather/src/actions/get_location.dart';
import 'package:flutter_cool_weather/src/actions/get_weather.dart';
import 'package:flutter_cool_weather/src/data/location_api.dart';
import 'package:flutter_cool_weather/src/data/weather_api.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:flutter_cool_weather/src/models/location.dart';
import 'package:flutter_cool_weather/src/models/weather.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpic {
  AppEpic(this._locationApi, this._weatherApi);

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetLocation>(_getLocation),
      TypedEpic<AppState, GetLocationSuccessful>(_getWeather),
    ]);
  }

  Stream<Object> _getLocation(Stream<GetLocation> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetLocation event) => _locationApi.getLocation())
        .map<Object>((Location location) => GetLocationSuccessful(location))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocationError(error));
  }

  Stream<Object> _getWeather(Stream<GetLocationSuccessful> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetLocationSuccessful event) => _weatherApi.getForecast(event.location))
        .map<Object>((Weather weather) => GetWeatherSuccessful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeatherError(error));
  }
}
