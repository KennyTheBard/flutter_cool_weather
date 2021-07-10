// GENERATED CODE - DO NOT MODIFY BY HAND

part of weather;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable<Object?> serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temperature',
      serializers.serialize(object.temperature, specifiedType: const FullType(double)),
      'weatherCondition',
      serializers.serialize(object.weatherCondition, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temperature':
          result.temperature = serializers.deserialize(value, specifiedType: const FullType(double)) as double;
          break;
        case 'weatherCondition':
          result.weatherCondition = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Weather extends Weather {
  @override
  final double temperature;
  @override
  final String weatherCondition;

  factory _$Weather([void Function(WeatherBuilder)? updates]) => (new WeatherBuilder()..update(updates)).build();

  _$Weather._({required this.temperature, required this.weatherCondition}) : super._() {
    BuiltValueNullFieldError.checkNotNull(temperature, 'Weather', 'temperature');
    BuiltValueNullFieldError.checkNotNull(weatherCondition, 'Weather', 'weatherCondition');
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather && temperature == other.temperature && weatherCondition == other.weatherCondition;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, temperature.hashCode), weatherCondition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Weather')
          ..add('temperature', temperature)
          ..add('weatherCondition', weatherCondition))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather? _$v;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  String? _weatherCondition;
  String? get weatherCondition => _$this._weatherCondition;
  set weatherCondition(String? weatherCondition) => _$this._weatherCondition = weatherCondition;

  WeatherBuilder();

  WeatherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temperature = $v.temperature;
      _weatherCondition = $v.weatherCondition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Weather build() {
    final _$result = _$v ??
        new _$Weather._(
            temperature: BuiltValueNullFieldError.checkNotNull(temperature, 'Weather', 'temperature'),
            weatherCondition: BuiltValueNullFieldError.checkNotNull(weatherCondition, 'Weather', 'weatherCondition'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
