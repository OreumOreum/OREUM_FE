// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_monthly_spot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeMonthlySpotState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<SpotMonthResponse> get monthlySpots =>
      throw _privateConstructorUsedError;
  Map<int, int> get myTypeVisitCounts => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;

  /// Create a copy of HomeMonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeMonthlySpotStateCopyWith<HomeMonthlySpotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMonthlySpotStateCopyWith<$Res> {
  factory $HomeMonthlySpotStateCopyWith(HomeMonthlySpotState value,
          $Res Function(HomeMonthlySpotState) then) =
      _$HomeMonthlySpotStateCopyWithImpl<$Res, HomeMonthlySpotState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> monthlySpots,
      Map<int, int> myTypeVisitCounts,
      int? year,
      int? month});
}

/// @nodoc
class _$HomeMonthlySpotStateCopyWithImpl<$Res,
        $Val extends HomeMonthlySpotState>
    implements $HomeMonthlySpotStateCopyWith<$Res> {
  _$HomeMonthlySpotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeMonthlySpotState
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeMonthlySpotStateImplCopyWith<$Res>
    implements $HomeMonthlySpotStateCopyWith<$Res> {
  factory _$$HomeMonthlySpotStateImplCopyWith(_$HomeMonthlySpotStateImpl value,
          $Res Function(_$HomeMonthlySpotStateImpl) then) =
      __$$HomeMonthlySpotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> monthlySpots,
      Map<int, int> myTypeVisitCounts,
      int? year,
      int? month});
}

/// @nodoc
class __$$HomeMonthlySpotStateImplCopyWithImpl<$Res>
    extends _$HomeMonthlySpotStateCopyWithImpl<$Res, _$HomeMonthlySpotStateImpl>
    implements _$$HomeMonthlySpotStateImplCopyWith<$Res> {
  __$$HomeMonthlySpotStateImplCopyWithImpl(_$HomeMonthlySpotStateImpl _value,
      $Res Function(_$HomeMonthlySpotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeMonthlySpotState
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
  }) {
    return _then(_$HomeMonthlySpotStateImpl(
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
    ));
  }
}

/// @nodoc

class _$HomeMonthlySpotStateImpl implements _HomeMonthlySpotState {
  const _$HomeMonthlySpotStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<SpotMonthResponse> monthlySpots = const [],
      final Map<int, int> myTypeVisitCounts = const {},
      this.year,
      this.month})
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
  String toString() {
    return 'HomeMonthlySpotState(status: $status, errorMessage: $errorMessage, monthlySpots: $monthlySpots, myTypeVisitCounts: $myTypeVisitCounts, year: $year, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMonthlySpotStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._monthlySpots, _monthlySpots) &&
            const DeepCollectionEquality()
                .equals(other._myTypeVisitCounts, _myTypeVisitCounts) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_monthlySpots),
      const DeepCollectionEquality().hash(_myTypeVisitCounts),
      year,
      month);

  /// Create a copy of HomeMonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeMonthlySpotStateImplCopyWith<_$HomeMonthlySpotStateImpl>
      get copyWith =>
          __$$HomeMonthlySpotStateImplCopyWithImpl<_$HomeMonthlySpotStateImpl>(
              this, _$identity);
}

abstract class _HomeMonthlySpotState implements HomeMonthlySpotState {
  const factory _HomeMonthlySpotState(
      {final UiStatus status,
      final String errorMessage,
      final List<SpotMonthResponse> monthlySpots,
      final Map<int, int> myTypeVisitCounts,
      final int? year,
      final int? month}) = _$HomeMonthlySpotStateImpl;

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

  /// Create a copy of HomeMonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeMonthlySpotStateImplCopyWith<_$HomeMonthlySpotStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
