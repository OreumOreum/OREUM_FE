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
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  PlaceResponse? get place => throw _privateConstructorUsedError;
  List<ReviewResponse> get reviews => throw _privateConstructorUsedError;
  TourResponse? get tour => throw _privateConstructorUsedError;
  List<Place> get typePlaces => throw _privateConstructorUsedError;
  String? get currentPlaceId => throw _privateConstructorUsedError;

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
      UiStatus buttonStatus,
      String errorMessage,
      PlaceResponse? place,
      List<ReviewResponse> reviews,
      TourResponse? tour,
      List<Place> typePlaces,
      String? currentPlaceId});

  $PlaceResponseCopyWith<$Res>? get place;
  $TourResponseCopyWith<$Res>? get tour;
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
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? place = freezed,
    Object? reviews = null,
    Object? tour = freezed,
    Object? typePlaces = null,
    Object? currentPlaceId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
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
      tour: freezed == tour
          ? _value.tour
          : tour // ignore: cast_nullable_to_non_nullable
              as TourResponse?,
      typePlaces: null == typePlaces
          ? _value.typePlaces
          : typePlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      currentPlaceId: freezed == currentPlaceId
          ? _value.currentPlaceId
          : currentPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TourResponseCopyWith<$Res>? get tour {
    if (_value.tour == null) {
      return null;
    }

    return $TourResponseCopyWith<$Res>(_value.tour!, (value) {
      return _then(_value.copyWith(tour: value) as $Val);
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
      UiStatus buttonStatus,
      String errorMessage,
      PlaceResponse? place,
      List<ReviewResponse> reviews,
      TourResponse? tour,
      List<Place> typePlaces,
      String? currentPlaceId});

  @override
  $PlaceResponseCopyWith<$Res>? get place;
  @override
  $TourResponseCopyWith<$Res>? get tour;
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
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? place = freezed,
    Object? reviews = null,
    Object? tour = freezed,
    Object? typePlaces = null,
    Object? currentPlaceId = freezed,
  }) {
    return _then(_$PlaceDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
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
      tour: freezed == tour
          ? _value.tour
          : tour // ignore: cast_nullable_to_non_nullable
              as TourResponse?,
      typePlaces: null == typePlaces
          ? _value._typePlaces
          : typePlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      currentPlaceId: freezed == currentPlaceId
          ? _value.currentPlaceId
          : currentPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlaceDetailStateImpl implements _PlaceDetailState {
  const _$PlaceDetailStateImpl(
      {this.status = UiStatus.idle,
      this.buttonStatus = UiStatus.idle,
      this.errorMessage = '',
      this.place,
      final List<ReviewResponse> reviews = const [],
      this.tour,
      final List<Place> typePlaces = const [],
      this.currentPlaceId})
      : _reviews = reviews,
        _typePlaces = typePlaces;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final UiStatus buttonStatus;
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
  final TourResponse? tour;
  final List<Place> _typePlaces;
  @override
  @JsonKey()
  List<Place> get typePlaces {
    if (_typePlaces is EqualUnmodifiableListView) return _typePlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typePlaces);
  }

  @override
  final String? currentPlaceId;

  @override
  String toString() {
    return 'PlaceDetailState(status: $status, buttonStatus: $buttonStatus, errorMessage: $errorMessage, place: $place, reviews: $reviews, tour: $tour, typePlaces: $typePlaces, currentPlaceId: $currentPlaceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buttonStatus, buttonStatus) ||
                other.buttonStatus == buttonStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.place, place) || other.place == place) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.tour, tour) || other.tour == tour) &&
            const DeepCollectionEquality()
                .equals(other._typePlaces, _typePlaces) &&
            (identical(other.currentPlaceId, currentPlaceId) ||
                other.currentPlaceId == currentPlaceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      buttonStatus,
      errorMessage,
      place,
      const DeepCollectionEquality().hash(_reviews),
      tour,
      const DeepCollectionEquality().hash(_typePlaces),
      currentPlaceId);

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
      final UiStatus buttonStatus,
      final String errorMessage,
      final PlaceResponse? place,
      final List<ReviewResponse> reviews,
      final TourResponse? tour,
      final List<Place> typePlaces,
      final String? currentPlaceId}) = _$PlaceDetailStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get buttonStatus;
  @override
  String get errorMessage;
  @override
  PlaceResponse? get place;
  @override
  List<ReviewResponse> get reviews;
  @override
  TourResponse? get tour;
  @override
  List<Place> get typePlaces;
  @override
  String? get currentPlaceId;

  /// Create a copy of PlaceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceDetailStateImplCopyWith<_$PlaceDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
