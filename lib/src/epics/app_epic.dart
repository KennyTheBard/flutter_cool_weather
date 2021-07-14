import 'package:flutter_cool_weather/src/actions/index.dart';
import 'package:flutter_cool_weather/src/data/location_api.dart';
import 'package:flutter_cool_weather/src/data/weather_api.dart';
import 'package:flutter_cool_weather/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpic {
  AppEpic(this._locationApi, this._weatherApi);

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetLocationStart>(_getLocation),
      TypedEpic<AppState, GetWeatherStart>(_getWeather),
    ]);
  }

  Stream<Object> _getLocation(Stream<GetLocationStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetLocationStart event) => _locationApi.getLocation())
        .expand((Location location) => <Object>[GetLocation.successful(location), const GetWeather()])
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocation.error(error, stackTrace));
  }

  Stream<Object> _getWeather(Stream<GetWeatherStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetWeatherStart event) => _weatherApi.getForecast(store.state.location!))
        .map<Object>((Weather weather) => GetWeather.successful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeather.error(error, stackTrace));
  }
}
