// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<SpotMonthResponse> get monthlySpots =>
      throw _privateConstructorUsedError;
  Map<int, int> get myTypeVisitCounts => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  WeatherInfo? get weatherInfo => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> monthlySpots,
      Map<int, int> myTypeVisitCounts,
      int? year,
      int? month,
      WeatherInfo? weatherInfo});

  $WeatherInfoCopyWith<$Res>? get weatherInfo;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? monthlySpots = null,
    Object? myTypeVisitCounts = null,
    Object? year = freezed,
    Object? month = freezed,
    Object? weatherInfo = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySpots: null == monthlySpots
          ? _value.monthlySpots
          : monthlySpots // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
      myTypeVisitCounts: null == myTypeVisitCounts
          ? _value.myTypeVisitCounts
          : myTypeVisitCounts // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      weatherInfo: freezed == weatherInfo
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as WeatherInfo?,
    ) as $Val);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInfoCopyWith<$Res>? get weatherInfo {
    if (_value.weatherInfo == null) {
      return null;
    }

    return $WeatherInfoCopyWith<$Res>(_value.weatherInfo!, (value) {
      return _then(_value.copyWith(weatherInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> monthlySpots,
      Map<int, int> myTypeVisitCounts,
      int? year,
      int? month,
      WeatherInfo? weatherInfo});

  @override
  $WeatherInfoCopyWith<$Res>? get weatherInfo;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? monthlySpots = null,
    Object? myTypeVisitCounts = null,
    Object? year = freezed,
    Object? month = freezed,
    Object? weatherInfo = freezed,
  }) {
    return _then(_$HomeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySpots: null == monthlySpots
          ? _value._monthlySpots
          : monthlySpots // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
      myTypeVisitCounts: null == myTypeVisitCounts
          ? _value._myTypeVisitCounts
          : myTypeVisitCounts // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      weatherInfo: freezed == weatherInfo
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as WeatherInfo?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<SpotMonthResponse> monthlySpots = const [],
      final Map<int, int> myTypeVisitCounts = const {},
      this.year,
      this.month,
      this.weatherInfo})
      : _monthlySpots = monthlySpots,
        _myTypeVisitCounts = myTypeVisitCounts;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<SpotMonthResponse> _monthlySpots;
  @override
  @JsonKey()
  List<SpotMonthResponse> get monthlySpots {
    if (_monthlySpots is EqualUnmodifiableListView) return _monthlySpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlySpots);
  }

  final Map<int, int> _myTypeVisitCounts;
  @override
  @JsonKey()
  Map<int, int> get myTypeVisitCounts {
    if (_myTypeVisitCounts is EqualUnmodifiableMapView)
      return _myTypeVisitCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_myTypeVisitCounts);
  }

  @override
  final int? year;
  @override
  final int? month;
  @override
  final WeatherInfo? weatherInfo;

  @override
  String toString() {
    return 'HomeState(status: $status, errorMessage: $errorMessage, monthlySpots: $monthlySpots, myTypeVisitCounts: $myTypeVisitCounts, year: $year, month: $month, weatherInfo: $weatherInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._monthlySpots, _monthlySpots) &&
            const DeepCollectionEquality()
                .equals(other._myTypeVisitCounts, _myTypeVisitCounts) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.weatherInfo, weatherInfo) ||
                other.weatherInfo == weatherInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_monthlySpots),
      const DeepCollectionEquality().hash(_myTypeVisitCounts),
      year,
      month,
      weatherInfo);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final UiStatus status,
      final String errorMessage,
      final List<SpotMonthResponse> monthlySpots,
      final Map<int, int> myTypeVisitCounts,
      final int? year,
      final int? month,
      final WeatherInfo? weatherInfo}) = _$HomeStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<SpotMonthResponse> get monthlySpots;
  @override
  Map<int, int> get myTypeVisitCounts;
  @override
  int? get year;
  @override
  int? get month;
  @override
  WeatherInfo? get weatherInfo;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
