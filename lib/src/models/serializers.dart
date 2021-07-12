import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_cool_weather/src/models/app_state.dart';
import 'package:flutter_cool_weather/src/models/location.dart';
import 'package:flutter_cool_weather/src/models/weather.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[AppState, Location, Weather])
Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
