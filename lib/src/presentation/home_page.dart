import 'package:flutter/material.dart';
import 'package:flutter_cool_weather/src/actions/index.dart';
import 'package:flutter_cool_weather/src/containers/is_loading_container.dart';
import 'package:flutter_cool_weather/src/containers/location_container.dart';
import 'package:flutter_cool_weather/src/containers/weather_container.dart';
import 'package:flutter_cool_weather/src/models/index.dart';
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
    StoreProvider.of<AppState>(context).dispatch(const GetLocation());
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
                              if (location != null)
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: const <Widget>[
                                            Text(
                                              'City',
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Country',
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              location.city,
                                              style: const TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              location.country,
                                              style: const TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  elevation: 5,
                                  margin: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              if (weather != null)
                                Card(
                                  color: Color.lerp(Colors.blue, Colors.red, (weather.temperature) / 35.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        ColorFiltered(
                                          child: Image.network(
                                              'https://icons-for-free.com/iconfiles/png/512/cloud+day+forecast+lightning+shine+storm+sun+weather+icon-1320183295537909806.png',
                                              fit: BoxFit.contain,
                                              width: 92),
                                          colorFilter: const ColorFilter.matrix(<double>[
                                            //R  G   B    A  Const
                                            -1, 0, 0, 0, 255, //
                                            0, -1, 0, 0, 255, //
                                            0, 0, -1, 0, 255, //
                                            0, 0, 0, 1, 0, //
                                          ]),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              weather.weatherCondition,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${weather.temperature}°C',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  elevation: 5,
                                  margin: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
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
