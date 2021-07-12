import 'package:flutter_cool_weather/src/actions/get_location.dart';
import 'package:flutter_cool_weather/src/actions/get_weather.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, GetLocation>(_getLocation),
  TypedReducer<AppState, GetLocationSuccessful>(_getLocationSuccessful),
  TypedReducer<AppState, GetLocationError>(_getLocationError),
  TypedReducer<AppState, GetWeather>(_getWeather),
  TypedReducer<AppState, GetWeatherSuccessful>(_getWeatherSuccessful),
  TypedReducer<AppState, GetWeatherError>(_getWeatherError),
]);

AppState _getLocation(AppState state, GetLocation action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getLocationSuccessful(AppState state, GetLocationSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..location = action.location.toBuilder()
      ..isLoading = false;
  });
}

AppState _getLocationError(AppState state, GetLocationError action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..error = action.error
      ..isLoading = false;
  });
}

AppState _getWeather(AppState state, GetWeather action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getWeatherSuccessful(AppState state, GetWeatherSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..weather = action.weather.toBuilder()
      ..isLoading = false;
  });
}

AppState _getWeatherError(AppState state, GetWeatherError action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..error = action.error
      ..isLoading = false;
  });
}
