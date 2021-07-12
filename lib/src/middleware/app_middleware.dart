import 'package:flutter_cool_weather/src/actions/get_location.dart';
import 'package:flutter_cool_weather/src/actions/get_weather.dart';
import 'package:flutter_cool_weather/src/data/location_api.dart';
import 'package:flutter_cool_weather/src/data/weather_api.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:flutter_cool_weather/src/models/location.dart';
import 'package:flutter_cool_weather/src/models/weather.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  AppMiddleware(this._locationApi, this._weatherApi);

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetWeather>(_getWeather),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);

    try {
      final Location location = await _locationApi.getLocation();
      print(location);

      store.dispatch(GetLocationSuccessful(location));

      store.dispatch(GetWeather());
    } catch (error) {
      store.dispatch(GetLocationError(error));
    }
  }

  Future<void> _getWeather(Store<AppState> store, GetWeather action, NextDispatcher next) async {
    next(action);

    try {
      final Weather weather = await _weatherApi.getForecast('${store.state.location!.city}%20${store.state.location!.country}');
      store.dispatch(GetWeatherSuccessful(weather));
    } catch (error) {
      store.dispatch(GetWeatherError(error));
    }
  }
}
