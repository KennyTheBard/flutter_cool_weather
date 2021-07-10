library forecast_response;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_cool_weather/src/models/forecast.dart';
import 'package:flutter_cool_weather/src/models/serializers.dart';

part 'forecast_response.g.dart';

abstract class ForecastResponse implements Built<ForecastResponse, ForecastResponseBuilder> {
  factory ForecastResponse([void Function(ForecastResponseBuilder b) updates]) = _$ForecastResponse;
  factory ForecastResponse.fromJson(dynamic json) => serializers.deserializeWith(serializer, json)!;

  ForecastResponse._();

  Forecast get current;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ForecastResponse> get serializer => _$forecastResponseSerializer;
}
