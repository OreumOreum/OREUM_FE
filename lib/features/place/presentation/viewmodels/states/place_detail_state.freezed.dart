// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaceDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  PlaceResponse? get place => throw _privateConstructorUsedError;
  List<ReviewResponse> get reviews => throw _privateConstructorUsedError;

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceDetailStateCopyWith<PlaceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailStateCopyWith<$Res> {
  factory $PlaceDetailStateCopyWith(
          PlaceDetailState value, $Res Function(PlaceDetailState) then) =
      _$PlaceDetailStateCopyWithImpl<$Res, PlaceDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      PlaceResponse? place,
      List<ReviewResponse> reviews});

  $PlaceResponseCopyWith<$Res>? get place;
}

/// @nodoc
class _$PlaceDetailStateCopyWithImpl<$Res, $Val extends PlaceDetailState>
    implements $PlaceDetailStateCopyWith<$Res> {
  _$PlaceDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? place = freezed,
    Object? reviews = null,
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
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceResponse?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
    ) as $Val);
  }

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceResponseCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $PlaceResponseCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceDetailStateImplCopyWith<$Res>
    implements $PlaceDetailStateCopyWith<$Res> {
  factory _$$PlaceDetailStateImplCopyWith(_$PlaceDetailStateImpl value,
          $Res Function(_$PlaceDetailStateImpl) then) =
      __$$PlaceDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      PlaceResponse? place,
      List<ReviewResponse> reviews});

  @override
  $PlaceResponseCopyWith<$Res>? get place;
}

/// @nodoc
class __$$PlaceDetailStateImplCopyWithImpl<$Res>
    extends _$PlaceDetailStateCopyWithImpl<$Res, _$PlaceDetailStateImpl>
    implements _$$PlaceDetailStateImplCopyWith<$Res> {
  __$$PlaceDetailStateImplCopyWithImpl(_$PlaceDetailStateImpl _value,
      $Res Function(_$PlaceDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? place = freezed,
    Object? reviews = null,
  }) {
    return _then(_$PlaceDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceResponse?,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
    ));
  }
}

/// @nodoc

class _$PlaceDetailStateImpl implements _PlaceDetailState {
  const _$PlaceDetailStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      this.place,
      final List<ReviewResponse> reviews = const []})
      : _reviews = reviews;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final PlaceResponse? place;
  final List<ReviewResponse> _reviews;
  @override
  @JsonKey()
  List<ReviewResponse> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'PlaceDetailState(status: $status, errorMessage: $errorMessage, place: $place, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.place, place) || other.place == place) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, place,
      const DeepCollectionEquality().hash(_reviews));

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailStateImplCopyWith<_$PlaceDetailStateImpl> get copyWith =>
      __$$PlaceDetailStateImplCopyWithImpl<_$PlaceDetailStateImpl>(
          this, _$identity);
}

abstract class _PlaceDetailState implements PlaceDetailState {
  const factory _PlaceDetailState(
      {final UiStatus status,
      final String errorMessage,
      final PlaceResponse? place,
      final List<ReviewResponse> reviews}) = _$PlaceDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  PlaceResponse? get place;
  @override
  List<ReviewResponse> get reviews;

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceDetailStateImplCopyWith<_$PlaceDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
