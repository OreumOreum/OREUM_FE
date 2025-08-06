// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_spot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlySpotState {
  MonthlySpotStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Map<String, List<SpotResponse>> get spotsByMonth =>
      throw _privateConstructorUsedError;

  /// Create a copy of MonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySpotStateCopyWith<MonthlySpotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySpotStateCopyWith<$Res> {
  factory $MonthlySpotStateCopyWith(
          MonthlySpotState value, $Res Function(MonthlySpotState) then) =
      _$MonthlySpotStateCopyWithImpl<$Res, MonthlySpotState>;
  @useResult
  $Res call(
      {MonthlySpotStatus status,
      String errorMessage,
      Map<String, List<SpotResponse>> spotsByMonth});
}

/// @nodoc
class _$MonthlySpotStateCopyWithImpl<$Res, $Val extends MonthlySpotState>
    implements $MonthlySpotStateCopyWith<$Res> {
  _$MonthlySpotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySpotState
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
              as MonthlySpotStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      spotsByMonth: null == spotsByMonth
          ? _value.spotsByMonth
          : spotsByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SpotResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySpotStateImplCopyWith<$Res>
    implements $MonthlySpotStateCopyWith<$Res> {
  factory _$$MonthlySpotStateImplCopyWith(_$MonthlySpotStateImpl value,
          $Res Function(_$MonthlySpotStateImpl) then) =
      __$$MonthlySpotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MonthlySpotStatus status,
      String errorMessage,
      Map<String, List<SpotResponse>> spotsByMonth});
}

/// @nodoc
class __$$MonthlySpotStateImplCopyWithImpl<$Res>
    extends _$MonthlySpotStateCopyWithImpl<$Res, _$MonthlySpotStateImpl>
    implements _$$MonthlySpotStateImplCopyWith<$Res> {
  __$$MonthlySpotStateImplCopyWithImpl(_$MonthlySpotStateImpl _value,
      $Res Function(_$MonthlySpotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? spotsByMonth = null,
  }) {
    return _then(_$MonthlySpotStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MonthlySpotStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      spotsByMonth: null == spotsByMonth
          ? _value._spotsByMonth
          : spotsByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, List<SpotResponse>>,
    ));
  }
}

/// @nodoc

class _$MonthlySpotStateImpl implements _MonthlySpotState {
  const _$MonthlySpotStateImpl(
      {this.status = MonthlySpotStatus.idle,
      this.errorMessage = '',
      final Map<String, List<SpotResponse>> spotsByMonth = const {}})
      : _spotsByMonth = spotsByMonth;

  @override
  @JsonKey()
  final MonthlySpotStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final Map<String, List<SpotResponse>> _spotsByMonth;
  @override
  @JsonKey()
  Map<String, List<SpotResponse>> get spotsByMonth {
    if (_spotsByMonth is EqualUnmodifiableMapView) return _spotsByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_spotsByMonth);
  }

  @override
  String toString() {
    return 'MonthlySpotState(status: $status, errorMessage: $errorMessage, spotsByMonth: $spotsByMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySpotStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._spotsByMonth, _spotsByMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_spotsByMonth));

  /// Create a copy of MonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySpotStateImplCopyWith<_$MonthlySpotStateImpl> get copyWith =>
      __$$MonthlySpotStateImplCopyWithImpl<_$MonthlySpotStateImpl>(
          this, _$identity);
}

abstract class _MonthlySpotState implements MonthlySpotState {
  const factory _MonthlySpotState(
          {final MonthlySpotStatus status,
          final String errorMessage,
          final Map<String, List<SpotResponse>> spotsByMonth}) =
      _$MonthlySpotStateImpl;

  @override
  MonthlySpotStatus get status;
  @override
  String get errorMessage;
  @override
  Map<String, List<SpotResponse>> get spotsByMonth;

  /// Create a copy of MonthlySpotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySpotStateImplCopyWith<_$MonthlySpotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
