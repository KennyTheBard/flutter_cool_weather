// GENERATED CODE - DO NOT MODIFY BY HAND

part of forecast_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForecastResponse> _$forecastResponseSerializer = new _$ForecastResponseSerializer();

class _$ForecastResponseSerializer implements StructuredSerializer<ForecastResponse> {
  @override
  final Iterable<Type> types = const [ForecastResponse, _$ForecastResponse];
  @override
  final String wireName = 'ForecastResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ForecastResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'current',
      serializers.serialize(object.current, specifiedType: const FullType(Forecast)),
    ];

    return result;
  }

  @override
  ForecastResponse deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForecastResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current':
          result.current.replace(serializers.deserialize(value, specifiedType: const FullType(Forecast))! as Forecast);
          break;
      }
    }

    return result.build();
  }
}

class _$ForecastResponse extends ForecastResponse {
  @override
  final Forecast current;

  factory _$ForecastResponse([void Function(ForecastResponseBuilder)? updates]) =>
      (new ForecastResponseBuilder()..update(updates)).build();

  _$ForecastResponse._({required this.current}) : super._() {
    BuiltValueNullFieldError.checkNotNull(current, 'ForecastResponse', 'current');
  }

  @override
  ForecastResponse rebuild(void Function(ForecastResponseBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ForecastResponseBuilder toBuilder() => new ForecastResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForecastResponse && current == other.current;
  }

  @override
  int get hashCode {
    return $jf($jc(0, current.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ForecastResponse')..add('current', current)).toString();
  }
}

class ForecastResponseBuilder implements Builder<ForecastResponse, ForecastResponseBuilder> {
  _$ForecastResponse? _$v;

  ForecastBuilder? _current;
  ForecastBuilder get current => _$this._current ??= new ForecastBuilder();
  set current(ForecastBuilder? current) => _$this._current = current;

  ForecastResponseBuilder();

  ForecastResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _current = $v.current.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForecastResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForecastResponse;
  }

  @override
  void update(void Function(ForecastResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ForecastResponse build() {
    _$ForecastResponse _$result;
    try {
      _$result = _$v ?? new _$ForecastResponse._(current: current.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'current';
        current.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('ForecastResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
