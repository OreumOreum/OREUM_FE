// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_spot_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlySpotMapState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  Set<Circle> get circles => throw _privateConstructorUsedError;
  List<SpotMonthResponse> get spots => throw _privateConstructorUsedError;
  bool get isProximity => throw _privateConstructorUsedError;
  double get currentZoom => throw _privateConstructorUsedError;
  LocationPermission get permissionStatus => throw _privateConstructorUsedError;
  SpotMonthResponse? get selectedSpot => throw _privateConstructorUsedError;
  SpotMonthResponse? get proximateSpot => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  Position? get currentPosition => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySpotMapStateCopyWith<MonthlySpotMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySpotMapStateCopyWith<$Res> {
  factory $MonthlySpotMapStateCopyWith(
          MonthlySpotMapState value, $Res Function(MonthlySpotMapState) then) =
      _$MonthlySpotMapStateCopyWithImpl<$Res, MonthlySpotMapState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      Set<Marker> markers,
      Set<Circle> circles,
      List<SpotMonthResponse> spots,
      bool isProximity,
      double currentZoom,
      LocationPermission permissionStatus,
      SpotMonthResponse? selectedSpot,
      SpotMonthResponse? proximateSpot,
      GoogleMapController? mapController,
      Position? currentPosition});

  $SpotMonthResponseCopyWith<$Res>? get selectedSpot;
  $SpotMonthResponseCopyWith<$Res>? get proximateSpot;
}

/// @nodoc
class _$MonthlySpotMapStateCopyWithImpl<$Res, $Val extends MonthlySpotMapState>
    implements $MonthlySpotMapStateCopyWith<$Res> {
  _$MonthlySpotMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? markers = null,
    Object? circles = null,
    Object? spots = null,
    Object? isProximity = null,
    Object? currentZoom = null,
    Object? permissionStatus = null,
    Object? selectedSpot = freezed,
    Object? proximateSpot = freezed,
    Object? mapController = freezed,
    Object? currentPosition = freezed,
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
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      circles: null == circles
          ? _value.circles
          : circles // ignore: cast_nullable_to_non_nullable
              as Set<Circle>,
      spots: null == spots
          ? _value.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
      isProximity: null == isProximity
          ? _value.isProximity
          : isProximity // ignore: cast_nullable_to_non_nullable
              as bool,
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
      permissionStatus: null == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
      selectedSpot: freezed == selectedSpot
          ? _value.selectedSpot
          : selectedSpot // ignore: cast_nullable_to_non_nullable
              as SpotMonthResponse?,
      proximateSpot: freezed == proximateSpot
          ? _value.proximateSpot
          : proximateSpot // ignore: cast_nullable_to_non_nullable
              as SpotMonthResponse?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotMonthResponseCopyWith<$Res>? get selectedSpot {
    if (_value.selectedSpot == null) {
      return null;
    }

    return $SpotMonthResponseCopyWith<$Res>(_value.selectedSpot!, (value) {
      return _then(_value.copyWith(selectedSpot: value) as $Val);
    });
  }

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpotMonthResponseCopyWith<$Res>? get proximateSpot {
    if (_value.proximateSpot == null) {
      return null;
    }

    return $SpotMonthResponseCopyWith<$Res>(_value.proximateSpot!, (value) {
      return _then(_value.copyWith(proximateSpot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlySpotMapStateImplCopyWith<$Res>
    implements $MonthlySpotMapStateCopyWith<$Res> {
  factory _$$MonthlySpotMapStateImplCopyWith(_$MonthlySpotMapStateImpl value,
          $Res Function(_$MonthlySpotMapStateImpl) then) =
      __$$MonthlySpotMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      Set<Marker> markers,
      Set<Circle> circles,
      List<SpotMonthResponse> spots,
      bool isProximity,
      double currentZoom,
      LocationPermission permissionStatus,
      SpotMonthResponse? selectedSpot,
      SpotMonthResponse? proximateSpot,
      GoogleMapController? mapController,
      Position? currentPosition});

  @override
  $SpotMonthResponseCopyWith<$Res>? get selectedSpot;
  @override
  $SpotMonthResponseCopyWith<$Res>? get proximateSpot;
}

/// @nodoc
class __$$MonthlySpotMapStateImplCopyWithImpl<$Res>
    extends _$MonthlySpotMapStateCopyWithImpl<$Res, _$MonthlySpotMapStateImpl>
    implements _$$MonthlySpotMapStateImplCopyWith<$Res> {
  __$$MonthlySpotMapStateImplCopyWithImpl(_$MonthlySpotMapStateImpl _value,
      $Res Function(_$MonthlySpotMapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? markers = null,
    Object? circles = null,
    Object? spots = null,
    Object? isProximity = null,
    Object? currentZoom = null,
    Object? permissionStatus = null,
    Object? selectedSpot = freezed,
    Object? proximateSpot = freezed,
    Object? mapController = freezed,
    Object? currentPosition = freezed,
  }) {
    return _then(_$MonthlySpotMapStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      circles: null == circles
          ? _value._circles
          : circles // ignore: cast_nullable_to_non_nullable
              as Set<Circle>,
      spots: null == spots
          ? _value._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<SpotMonthResponse>,
      isProximity: null == isProximity
          ? _value.isProximity
          : isProximity // ignore: cast_nullable_to_non_nullable
              as bool,
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
      permissionStatus: null == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
      selectedSpot: freezed == selectedSpot
          ? _value.selectedSpot
          : selectedSpot // ignore: cast_nullable_to_non_nullable
              as SpotMonthResponse?,
      proximateSpot: freezed == proximateSpot
          ? _value.proximateSpot
          : proximateSpot // ignore: cast_nullable_to_non_nullable
              as SpotMonthResponse?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$MonthlySpotMapStateImpl implements _MonthlySpotMapState {
  const _$MonthlySpotMapStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final Set<Marker> markers = const {},
      final Set<Circle> circles = const {},
      final List<SpotMonthResponse> spots = const [],
      this.isProximity = false,
      this.currentZoom = 15.0,
      this.permissionStatus = LocationPermission.denied,
      this.selectedSpot,
      this.proximateSpot,
      this.mapController,
      this.currentPosition})
      : _markers = markers,
        _circles = circles,
        _spots = spots;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  final Set<Circle> _circles;
  @override
  @JsonKey()
  Set<Circle> get circles {
    if (_circles is EqualUnmodifiableSetView) return _circles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_circles);
  }

  final List<SpotMonthResponse> _spots;
  @override
  @JsonKey()
  List<SpotMonthResponse> get spots {
    if (_spots is EqualUnmodifiableListView) return _spots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  @override
  @JsonKey()
  final bool isProximity;
  @override
  @JsonKey()
  final double currentZoom;
  @override
  @JsonKey()
  final LocationPermission permissionStatus;
  @override
  final SpotMonthResponse? selectedSpot;
  @override
  final SpotMonthResponse? proximateSpot;
  @override
  final GoogleMapController? mapController;
  @override
  final Position? currentPosition;

  @override
  String toString() {
    return 'MonthlySpotMapState(status: $status, errorMessage: $errorMessage, markers: $markers, circles: $circles, spots: $spots, isProximity: $isProximity, currentZoom: $currentZoom, permissionStatus: $permissionStatus, selectedSpot: $selectedSpot, proximateSpot: $proximateSpot, mapController: $mapController, currentPosition: $currentPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySpotMapStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality().equals(other._circles, _circles) &&
            const DeepCollectionEquality().equals(other._spots, _spots) &&
            (identical(other.isProximity, isProximity) ||
                other.isProximity == isProximity) &&
            (identical(other.currentZoom, currentZoom) ||
                other.currentZoom == currentZoom) &&
            (identical(other.permissionStatus, permissionStatus) ||
                other.permissionStatus == permissionStatus) &&
            (identical(other.selectedSpot, selectedSpot) ||
                other.selectedSpot == selectedSpot) &&
            (identical(other.proximateSpot, proximateSpot) ||
                other.proximateSpot == proximateSpot) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_circles),
      const DeepCollectionEquality().hash(_spots),
      isProximity,
      currentZoom,
      permissionStatus,
      selectedSpot,
      proximateSpot,
      mapController,
      currentPosition);

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySpotMapStateImplCopyWith<_$MonthlySpotMapStateImpl> get copyWith =>
      __$$MonthlySpotMapStateImplCopyWithImpl<_$MonthlySpotMapStateImpl>(
          this, _$identity);
}

abstract class _MonthlySpotMapState implements MonthlySpotMapState {
  const factory _MonthlySpotMapState(
      {final UiStatus status,
      final String errorMessage,
      final Set<Marker> markers,
      final Set<Circle> circles,
      final List<SpotMonthResponse> spots,
      final bool isProximity,
      final double currentZoom,
      final LocationPermission permissionStatus,
      final SpotMonthResponse? selectedSpot,
      final SpotMonthResponse? proximateSpot,
      final GoogleMapController? mapController,
      final Position? currentPosition}) = _$MonthlySpotMapStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  Set<Marker> get markers;
  @override
  Set<Circle> get circles;
  @override
  List<SpotMonthResponse> get spots;
  @override
  bool get isProximity;
  @override
  double get currentZoom;
  @override
  LocationPermission get permissionStatus;
  @override
  SpotMonthResponse? get selectedSpot;
  @override
  SpotMonthResponse? get proximateSpot;
  @override
  GoogleMapController? get mapController;
  @override
  Position? get currentPosition;

  /// Create a copy of MonthlySpotMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySpotMapStateImplCopyWith<_$MonthlySpotMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
