library forecast;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_cool_weather/src/models/serializers.dart';
import 'package:flutter_cool_weather/src/models/weather_condition.dart';

part 'forecast.g.dart';

abstract class Forecast implements Built<Forecast, ForecastBuilder> {
  factory Forecast([void Function(ForecastBuilder b) updates]) = _$Forecast;

  factory Forecast.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  Forecast._();

  @BuiltValueField(wireName: 'temp_c')
  double get temperature;

  WeatherCondition get condition;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Forecast> get serializer => _$forecastSerializer;
}
