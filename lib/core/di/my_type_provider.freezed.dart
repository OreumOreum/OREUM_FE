// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_type_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyTravelTypeState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  TravelType? get myTravelType => throw _privateConstructorUsedError;

  /// Create a copy of MyTravelTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTravelTypeStateCopyWith<MyTravelTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTravelTypeStateCopyWith<$Res> {
  factory $MyTravelTypeStateCopyWith(
          MyTravelTypeState value, $Res Function(MyTravelTypeState) then) =
      _$MyTravelTypeStateCopyWithImpl<$Res, MyTravelTypeState>;
  @useResult
  $Res call({UiStatus status, String errorMessage, TravelType? myTravelType});
}

/// @nodoc
class _$MyTravelTypeStateCopyWithImpl<$Res, $Val extends MyTravelTypeState>
    implements $MyTravelTypeStateCopyWith<$Res> {
  _$MyTravelTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTravelTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? myTravelType = freezed,
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
      myTravelType: freezed == myTravelType
          ? _value.myTravelType
          : myTravelType // ignore: cast_nullable_to_non_nullable
              as TravelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTravelTypeStateImplCopyWith<$Res>
    implements $MyTravelTypeStateCopyWith<$Res> {
  factory _$$MyTravelTypeStateImplCopyWith(_$MyTravelTypeStateImpl value,
          $Res Function(_$MyTravelTypeStateImpl) then) =
      __$$MyTravelTypeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UiStatus status, String errorMessage, TravelType? myTravelType});
}

/// @nodoc
class __$$MyTravelTypeStateImplCopyWithImpl<$Res>
    extends _$MyTravelTypeStateCopyWithImpl<$Res, _$MyTravelTypeStateImpl>
    implements _$$MyTravelTypeStateImplCopyWith<$Res> {
  __$$MyTravelTypeStateImplCopyWithImpl(_$MyTravelTypeStateImpl _value,
      $Res Function(_$MyTravelTypeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTravelTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? myTravelType = freezed,
  }) {
    return _then(_$MyTravelTypeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      myTravelType: freezed == myTravelType
          ? _value.myTravelType
          : myTravelType // ignore: cast_nullable_to_non_nullable
              as TravelType?,
    ));
  }
}

/// @nodoc

class _$MyTravelTypeStateImpl implements _MyTravelTypeState {
  const _$MyTravelTypeStateImpl(
      {this.status = UiStatus.idle, this.errorMessage = '', this.myTravelType});

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final TravelType? myTravelType;

  @override
  String toString() {
    return 'MyTravelTypeState(status: $status, errorMessage: $errorMessage, myTravelType: $myTravelType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTravelTypeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.myTravelType, myTravelType) ||
                other.myTravelType == myTravelType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, myTravelType);

  /// Create a copy of MyTravelTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTravelTypeStateImplCopyWith<_$MyTravelTypeStateImpl> get copyWith =>
      __$$MyTravelTypeStateImplCopyWithImpl<_$MyTravelTypeStateImpl>(
          this, _$identity);
}

abstract class _MyTravelTypeState implements MyTravelTypeState {
  const factory _MyTravelTypeState(
      {final UiStatus status,
      final String errorMessage,
      final TravelType? myTravelType}) = _$MyTravelTypeStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  TravelType? get myTravelType;

  /// Create a copy of MyTravelTypeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTravelTypeStateImplCopyWith<_$MyTravelTypeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
