// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'isLoading',
      serializers.serialize(object.isLoading, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.location;
    if (value != null) {
      result..add('location')..add(serializers.serialize(value, specifiedType: const FullType(Location)));
    }
    value = object.weather;
    if (value != null) {
      result..add('weather')..add(serializers.serialize(value, specifiedType: const FullType(Weather)));
    }
    value = object.error;
    if (value != null) {
      result..add('error')..add(serializers.serialize(value, specifiedType: const FullType(Object)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value, specifiedType: const FullType(Location))! as Location);
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value, specifiedType: const FullType(Weather))! as Weather);
          break;
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(Object));
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final Location? location;
  @override
  final Weather? weather;
  @override
  final Object? error;

  factory _$AppState([void Function(AppStateBuilder)? updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._({required this.isLoading, this.location, this.weather, this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, 'AppState', 'isLoading');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        isLoading == other.isLoading &&
        location == other.location &&
        weather == other.weather &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, isLoading.hashCode), location.hashCode), weather.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('location', location)
          ..add('weather', weather)
          ..add('error', error))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  LocationBuilder? _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder? location) => _$this._location = location;

  WeatherBuilder? _weather;
  WeatherBuilder get weather => _$this._weather ??= new WeatherBuilder();
  set weather(WeatherBuilder? weather) => _$this._weather = weather;

  Object? _error;
  Object? get error => _$this._error;
  set error(Object? error) => _$this._error = error;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _location = $v.location?.toBuilder();
      _weather = $v.weather?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(isLoading, 'AppState', 'isLoading'),
              location: _location?.build(),
              weather: _weather?.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        _location?.build();
        _$failedField = 'weather';
        _weather?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
