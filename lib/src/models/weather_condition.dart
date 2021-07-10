library weather_condition;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_cool_weather/src/models/serializers.dart';

part 'weather_condition.g.dart';

abstract class WeatherCondition implements Built<WeatherCondition, WeatherConditionBuilder> {
  factory WeatherCondition([void Function(WeatherConditionBuilder b) updates]) = _$WeatherCondition;
  factory WeatherCondition.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  WeatherCondition._();

  @BuiltValueField(wireName: 'text')
  String get name;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<WeatherCondition> get serializer => _$weatherConditionSerializer;
}
