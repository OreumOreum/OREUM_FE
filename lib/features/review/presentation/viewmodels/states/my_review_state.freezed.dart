// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyReviewState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<MyReviewResponse>? get myReviews => throw _privateConstructorUsedError;

  /// Create a copy of MyReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyReviewStateCopyWith<MyReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReviewStateCopyWith<$Res> {
  factory $MyReviewStateCopyWith(
          MyReviewState value, $Res Function(MyReviewState) then) =
      _$MyReviewStateCopyWithImpl<$Res, MyReviewState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<MyReviewResponse>? myReviews});
}

/// @nodoc
class _$MyReviewStateCopyWithImpl<$Res, $Val extends MyReviewState>
    implements $MyReviewStateCopyWith<$Res> {
  _$MyReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? myReviews = freezed,
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
      myReviews: freezed == myReviews
          ? _value.myReviews
          : myReviews // ignore: cast_nullable_to_non_nullable
              as List<MyReviewResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyReviewStateImplCopyWith<$Res>
    implements $MyReviewStateCopyWith<$Res> {
  factory _$$MyReviewStateImplCopyWith(
          _$MyReviewStateImpl value, $Res Function(_$MyReviewStateImpl) then) =
      __$$MyReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<MyReviewResponse>? myReviews});
}

/// @nodoc
class __$$MyReviewStateImplCopyWithImpl<$Res>
    extends _$MyReviewStateCopyWithImpl<$Res, _$MyReviewStateImpl>
    implements _$$MyReviewStateImplCopyWith<$Res> {
  __$$MyReviewStateImplCopyWithImpl(
      _$MyReviewStateImpl _value, $Res Function(_$MyReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? myReviews = freezed,
  }) {
    return _then(_$MyReviewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      myReviews: freezed == myReviews
          ? _value._myReviews
          : myReviews // ignore: cast_nullable_to_non_nullable
              as List<MyReviewResponse>?,
    ));
  }
}

/// @nodoc

class _$MyReviewStateImpl implements _MyReviewState {
  const _$MyReviewStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<MyReviewResponse>? myReviews})
      : _myReviews = myReviews;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<MyReviewResponse>? _myReviews;
  @override
  List<MyReviewResponse>? get myReviews {
    final value = _myReviews;
    if (value == null) return null;
    if (_myReviews is EqualUnmodifiableListView) return _myReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyReviewState(status: $status, errorMessage: $errorMessage, myReviews: $myReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReviewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._myReviews, _myReviews));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_myReviews));

  /// Create a copy of MyReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReviewStateImplCopyWith<_$MyReviewStateImpl> get copyWith =>
      __$$MyReviewStateImplCopyWithImpl<_$MyReviewStateImpl>(this, _$identity);
}

abstract class _MyReviewState implements MyReviewState {
  const factory _MyReviewState(
      {final UiStatus status,
      final String errorMessage,
      final List<MyReviewResponse>? myReviews}) = _$MyReviewStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<MyReviewResponse>? get myReviews;

  /// Create a copy of MyReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyReviewStateImplCopyWith<_$MyReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
