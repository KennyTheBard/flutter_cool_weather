// GENERATED CODE - DO NOT MODIFY BY HAND

part of forecast;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Forecast> _$forecastSerializer = new _$ForecastSerializer();

class _$ForecastSerializer implements StructuredSerializer<Forecast> {
  @override
  final Iterable<Type> types = const [Forecast, _$Forecast];
  @override
  final String wireName = 'Forecast';

  @override
  Iterable<Object?> serialize(Serializers serializers, Forecast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temp_c',
      serializers.serialize(object.temperature, specifiedType: const FullType(double)),
      'condition',
      serializers.serialize(object.condition, specifiedType: const FullType(WeatherCondition)),
    ];

    return result;
  }

  @override
  Forecast deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForecastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp_c':
          result.temperature = serializers.deserialize(value, specifiedType: const FullType(double)) as double;
          break;
        case 'condition':
          result.condition.replace(
              serializers.deserialize(value, specifiedType: const FullType(WeatherCondition))! as WeatherCondition);
          break;
      }
    }

    return result.build();
  }
}

class _$Forecast extends Forecast {
  @override
  final double temperature;
  @override
  final WeatherCondition condition;

  factory _$Forecast([void Function(ForecastBuilder)? updates]) => (new ForecastBuilder()..update(updates)).build();

  _$Forecast._({required this.temperature, required this.condition}) : super._() {
    BuiltValueNullFieldError.checkNotNull(temperature, 'Forecast', 'temperature');
    BuiltValueNullFieldError.checkNotNull(condition, 'Forecast', 'condition');
  }

  @override
  Forecast rebuild(void Function(ForecastBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ForecastBuilder toBuilder() => new ForecastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast && temperature == other.temperature && condition == other.condition;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, temperature.hashCode), condition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Forecast')..add('temperature', temperature)..add('condition', condition))
        .toString();
  }
}

class ForecastBuilder implements Builder<Forecast, ForecastBuilder> {
  _$Forecast? _$v;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  WeatherConditionBuilder? _condition;
  WeatherConditionBuilder get condition => _$this._condition ??= new WeatherConditionBuilder();
  set condition(WeatherConditionBuilder? condition) => _$this._condition = condition;

  ForecastBuilder();

  ForecastBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temperature = $v.temperature;
      _condition = $v.condition.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Forecast other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Forecast;
  }

  @override
  void update(void Function(ForecastBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Forecast build() {
    _$Forecast _$result;
    try {
      _$result = _$v ??
          new _$Forecast._(
              temperature: BuiltValueNullFieldError.checkNotNull(temperature, 'Forecast', 'temperature'),
              condition: condition.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'condition';
        condition.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Forecast', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
