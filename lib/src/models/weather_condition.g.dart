// GENERATED CODE - DO NOT MODIFY BY HAND

part of weather_condition;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherCondition> _$weatherConditionSerializer = new _$WeatherConditionSerializer();

class _$WeatherConditionSerializer implements StructuredSerializer<WeatherCondition> {
  @override
  final Iterable<Type> types = const [WeatherCondition, _$WeatherCondition];
  @override
  final String wireName = 'WeatherCondition';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherCondition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherCondition deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherConditionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherCondition extends WeatherCondition {
  @override
  final String name;

  factory _$WeatherCondition([void Function(WeatherConditionBuilder)? updates]) =>
      (new WeatherConditionBuilder()..update(updates)).build();

  _$WeatherCondition._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'WeatherCondition', 'name');
  }

  @override
  WeatherCondition rebuild(void Function(WeatherConditionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  WeatherConditionBuilder toBuilder() => new WeatherConditionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherCondition && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherCondition')..add('name', name)).toString();
  }
}

class WeatherConditionBuilder implements Builder<WeatherCondition, WeatherConditionBuilder> {
  _$WeatherCondition? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  WeatherConditionBuilder();

  WeatherConditionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherCondition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherCondition;
  }

  @override
  void update(void Function(WeatherConditionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherCondition build() {
    final _$result =
        _$v ?? new _$WeatherCondition._(name: BuiltValueNullFieldError.checkNotNull(name, 'WeatherCondition', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
