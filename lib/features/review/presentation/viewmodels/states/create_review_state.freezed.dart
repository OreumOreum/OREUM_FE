// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateReviewState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CreateReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReviewStateCopyWith<CreateReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewStateCopyWith<$Res> {
  factory $CreateReviewStateCopyWith(
          CreateReviewState value, $Res Function(CreateReviewState) then) =
      _$CreateReviewStateCopyWithImpl<$Res, CreateReviewState>;
  @useResult
  $Res call({UiStatus status, String errorMessage});
}

/// @nodoc
class _$CreateReviewStateCopyWithImpl<$Res, $Val extends CreateReviewState>
    implements $CreateReviewStateCopyWith<$Res> {
  _$CreateReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReviewStateImplCopyWith<$Res>
    implements $CreateReviewStateCopyWith<$Res> {
  factory _$$CreateReviewStateImplCopyWith(_$CreateReviewStateImpl value,
          $Res Function(_$CreateReviewStateImpl) then) =
      __$$CreateReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UiStatus status, String errorMessage});
}

/// @nodoc
class __$$CreateReviewStateImplCopyWithImpl<$Res>
    extends _$CreateReviewStateCopyWithImpl<$Res, _$CreateReviewStateImpl>
    implements _$$CreateReviewStateImplCopyWith<$Res> {
  __$$CreateReviewStateImplCopyWithImpl(_$CreateReviewStateImpl _value,
      $Res Function(_$CreateReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$CreateReviewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateReviewStateImpl implements _CreateReviewState {
  const _$CreateReviewStateImpl(
      {this.status = UiStatus.idle, this.errorMessage = ''});

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'CreateReviewState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReviewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  /// Create a copy of CreateReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReviewStateImplCopyWith<_$CreateReviewStateImpl> get copyWith =>
      __$$CreateReviewStateImplCopyWithImpl<_$CreateReviewStateImpl>(
          this, _$identity);
}

abstract class _CreateReviewState implements CreateReviewState {
  const factory _CreateReviewState(
      {final UiStatus status,
      final String errorMessage}) = _$CreateReviewStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;

  /// Create a copy of CreateReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReviewStateImplCopyWith<_$CreateReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
