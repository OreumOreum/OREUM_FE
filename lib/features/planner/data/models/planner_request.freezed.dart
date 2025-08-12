// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlannerRequest _$PlannerRequestFromJson(Map<String, dynamic> json) {
  return _PlannerRequest.fromJson(json);
}

/// @nodoc
mixin _$PlannerRequest {
  String get name => throw _privateConstructorUsedError;
  List<Place> get places => throw _privateConstructorUsedError;

  /// Serializes this PlannerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerRequestCopyWith<PlannerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerRequestCopyWith<$Res> {
  factory $PlannerRequestCopyWith(
          PlannerRequest value, $Res Function(PlannerRequest) then) =
      _$PlannerRequestCopyWithImpl<$Res, PlannerRequest>;
  @useResult
  $Res call({String name, List<Place> places});
}

/// @nodoc
class _$PlannerRequestCopyWithImpl<$Res, $Val extends PlannerRequest>
    implements $PlannerRequestCopyWith<$Res> {
  _$PlannerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerRequestImplCopyWith<$Res>
    implements $PlannerRequestCopyWith<$Res> {
  factory _$$PlannerRequestImplCopyWith(_$PlannerRequestImpl value,
          $Res Function(_$PlannerRequestImpl) then) =
      __$$PlannerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<Place> places});
}

/// @nodoc
class __$$PlannerRequestImplCopyWithImpl<$Res>
    extends _$PlannerRequestCopyWithImpl<$Res, _$PlannerRequestImpl>
    implements _$$PlannerRequestImplCopyWith<$Res> {
  __$$PlannerRequestImplCopyWithImpl(
      _$PlannerRequestImpl _value, $Res Function(_$PlannerRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? places = null,
  }) {
    return _then(_$PlannerRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannerRequestImpl
    with DiagnosticableTreeMixin
    implements _PlannerRequest {
  const _$PlannerRequestImpl(
      {required this.name, required final List<Place> places})
      : _places = places;

  factory _$PlannerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannerRequestImplFromJson(json);

  @override
  final String name;
  final List<Place> _places;
  @override
  List<Place> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlannerRequest(name: $name, places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlannerRequest'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_places));

  /// Create a copy of PlannerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerRequestImplCopyWith<_$PlannerRequestImpl> get copyWith =>
      __$$PlannerRequestImplCopyWithImpl<_$PlannerRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannerRequestImplToJson(
      this,
    );
  }
}

abstract class _PlannerRequest implements PlannerRequest {
  const factory _PlannerRequest(
      {required final String name,
      required final List<Place> places}) = _$PlannerRequestImpl;

  factory _PlannerRequest.fromJson(Map<String, dynamic> json) =
      _$PlannerRequestImpl.fromJson;

  @override
  String get name;
  @override
  List<Place> get places;

  /// Create a copy of PlannerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerRequestImplCopyWith<_$PlannerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  int get placeId => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call({int placeId, int day, int order});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? day = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int placeId, int day, int order});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? day = null,
    Object? order = null,
  }) {
    return _then(_$PlaceImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl with DiagnosticableTreeMixin implements _Place {
  const _$PlaceImpl(
      {required this.placeId, required this.day, required this.order});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final int placeId;
  @override
  final int day;
  @override
  final int order;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Place(placeId: $placeId, day: $day, order: $order)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Place'))
      ..add(DiagnosticsProperty('placeId', placeId))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('order', order));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, day, order);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {required final int placeId,
      required final int day,
      required final int order}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  int get placeId;
  @override
  int get day;
  @override
  int get order;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
