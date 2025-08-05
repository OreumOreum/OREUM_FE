// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_spot_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlySpotDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<SpotMonthResponse> get spotsByMonth =>
      throw _privateConstructorUsedError;

  /// Create a copy of MonthlySpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySpotDetailStateCopyWith<MonthlySpotDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySpotDetailStateCopyWith<$Res> {
  factory $MonthlySpotDetailStateCopyWith(MonthlySpotDetailState value,
          $Res Function(MonthlySpotDetailState) then) =
      _$MonthlySpotDetailStateCopyWithImpl<$Res, MonthlySpotDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> spotsByMonth});
}

/// @nodoc
class _$MonthlySpotDetailStateCopyWithImpl<$Res,
        $Val extends MonthlySpotDetailState>
    implements $MonthlySpotDetailStateCopyWith<$Res> {
  _$MonthlySpotDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? spotsByMonth = null,
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
      spotsByMonth: null == spotsByMonth
          ? _value.spotsByMonth
          : spotsByMonth // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySpotDetailStateImplCopyWith<$Res>
    implements $MonthlySpotDetailStateCopyWith<$Res> {
  factory _$$MonthlySpotDetailStateImplCopyWith(
          _$MonthlySpotDetailStateImpl value,
          $Res Function(_$MonthlySpotDetailStateImpl) then) =
      __$$MonthlySpotDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<SpotMonthResponse> spotsByMonth});
}

/// @nodoc
class __$$MonthlySpotDetailStateImplCopyWithImpl<$Res>
    extends _$MonthlySpotDetailStateCopyWithImpl<$Res,
        _$MonthlySpotDetailStateImpl>
    implements _$$MonthlySpotDetailStateImplCopyWith<$Res> {
  __$$MonthlySpotDetailStateImplCopyWithImpl(
      _$MonthlySpotDetailStateImpl _value,
      $Res Function(_$MonthlySpotDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? spotsByMonth = null,
  }) {
    return _then(_$MonthlySpotDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      spotsByMonth: null == spotsByMonth
          ? _value._spotsByMonth
          : spotsByMonth // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
    ));
  }
}

/// @nodoc

class _$MonthlySpotDetailStateImpl implements _MonthlySpotDetailState {
  const _$MonthlySpotDetailStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<SpotMonthResponse> spotsByMonth = const []})
      : _spotsByMonth = spotsByMonth;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<SpotMonthResponse> _spotsByMonth;
  @override
  @JsonKey()
  List<SpotMonthResponse> get spotsByMonth {
    if (_spotsByMonth is EqualUnmodifiableListView) return _spotsByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spotsByMonth);
  }

  @override
  String toString() {
    return 'MonthlySpotDetailState(status: $status, errorMessage: $errorMessage, spotsByMonth: $spotsByMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySpotDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._spotsByMonth, _spotsByMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_spotsByMonth));

  /// Create a copy of MonthlySpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySpotDetailStateImplCopyWith<_$MonthlySpotDetailStateImpl>
      get copyWith => __$$MonthlySpotDetailStateImplCopyWithImpl<
          _$MonthlySpotDetailStateImpl>(this, _$identity);
}

abstract class _MonthlySpotDetailState implements MonthlySpotDetailState {
  const factory _MonthlySpotDetailState(
          {final UiStatus status,
          final String errorMessage,
          final List<SpotMonthResponse> spotsByMonth}) =
      _$MonthlySpotDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<SpotMonthResponse> get spotsByMonth;

  /// Create a copy of MonthlySpotDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySpotDetailStateImplCopyWith<_$MonthlySpotDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
