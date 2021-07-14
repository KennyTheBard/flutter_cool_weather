import 'package:flutter/material.dart';
import 'package:flutter_cool_weather/src/actions/index.dart';
import 'package:flutter_cool_weather/src/data/location_api.dart';
import 'package:flutter_cool_weather/src/data/weather_api.dart';
import 'package:flutter_cool_weather/src/epics/app_epic.dart';
import 'package:flutter_cool_weather/src/models/index.dart';
import 'package:flutter_cool_weather/src/presentation/home_page.dart';
import 'package:flutter_cool_weather/src/reducers/reducers.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final LocationApi locationApi = LocationApi(client: Client(), locationApiUrl: 'http://ip-api.com/json/?fields=61439');
  final WeatherApi weatherApi = WeatherApi(
    client: Client(),
    weatherApiUrl: 'https://api.weatherapi.com/v1/forecast.json',
    weatherApiKey: '4305e859d9db460db5b182303211103',
  );
  final AppEpic epic = AppEpic(locationApi, weatherApi);
  final AppState initialState = AppState((AppStateBuilder b) {
    b
      ..isLoading = false
      ..location = null
      ..weather = null
      ..error = null;
  });
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );

  store.dispatch(const GetLocation());

  runApp(CoolWeather(store: store));
}

class CoolWeather extends StatelessWidget {
  const CoolWeather({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Cool Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Cool Weather'),
      ),
    );
  }
}
