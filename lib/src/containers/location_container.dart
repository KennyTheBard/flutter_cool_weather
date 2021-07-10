import 'package:flutter/material.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:flutter_cool_weather/src/models/location.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<Location?> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Location?>(
      converter: (Store<AppState> store) {
        return store.state.location;
      },
      builder: builder,
    );
  }
}
