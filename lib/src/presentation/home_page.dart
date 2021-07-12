import 'package:flutter/material.dart';
import 'package:flutter_cool_weather/src/actions/get_location.dart';
import 'package:flutter_cool_weather/src/actions/get_weather.dart';
import 'package:flutter_cool_weather/src/containers/is_loading_container.dart';
import 'package:flutter_cool_weather/src/containers/location_container.dart';
import 'package:flutter_cool_weather/src/containers/weather_container.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:flutter_cool_weather/src/models/location.dart';
import 'package:flutter_cool_weather/src/models/weather.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadWeather() {
    StoreProvider.of<AppState>(context).dispatch(GetLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: IsLoadingContainer(
          builder: (BuildContext context, bool isLoading) {
            return LocationContainer(
              builder: (BuildContext context, Location? location) {
                return WeatherContainer(
                  builder: (BuildContext context, Weather? weather) {
                    return isLoading || (location == null && weather == null)
                        ? const SpinKitRing(color: Colors.white)
                        : Column(
                            children: <Widget>[
                              if (location != null) Text('Current location: ${location.city} ${location.country}'),
                              if (weather != null) Text('${weather.weatherCondition} (${weather.temperature}°C)'),
                            ],
                          );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadWeather,
        child: const Icon(Icons.gps_fixed),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
