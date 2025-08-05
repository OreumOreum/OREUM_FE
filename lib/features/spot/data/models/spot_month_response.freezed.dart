// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_month_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpotMonthResponse _$SpotMonthResponseFromJson(Map<String, dynamic> json) {
  return _SpotMonthResponse.fromJson(json);
}

/// @nodoc
mixin _$SpotMonthResponse {
  int get spotId => throw _privateConstructorUsedError;
  int get placeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get detailAddress => throw _privateConstructorUsedError;
  double get mapX => throw _privateConstructorUsedError;
  double get mapY => throw _privateConstructorUsedError;
  bool get visited => throw _privateConstructorUsedError;

  /// Serializes this SpotMonthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotMonthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotMonthResponseCopyWith<SpotMonthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotMonthResponseCopyWith<$Res> {
  factory $SpotMonthResponseCopyWith(
          SpotMonthResponse value, $Res Function(SpotMonthResponse) then) =
      _$SpotMonthResponseCopyWithImpl<$Res, SpotMonthResponse>;
  @useResult
  $Res call(
      {int spotId,
      int placeId,
      String title,
      String address,
      String detailAddress,
      double mapX,
      double mapY,
      bool visited});
}

/// @nodoc
class _$SpotMonthResponseCopyWithImpl<$Res, $Val extends SpotMonthResponse>
    implements $SpotMonthResponseCopyWith<$Res> {
  _$SpotMonthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotMonthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotId = null,
    Object? placeId = null,
    Object? title = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? mapX = null,
    Object? mapY = null,
    Object? visited = null,
  }) {
    return _then(_value.copyWith(
      spotId: null == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mapX: null == mapX
          ? _value.mapX
          : mapX // ignore: cast_nullable_to_non_nullable
              as double,
      mapY: null == mapY
          ? _value.mapY
          : mapY // ignore: cast_nullable_to_non_nullable
              as double,
      visited: null == visited
          ? _value.visited
          : visited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotMonthResponseImplCopyWith<$Res>
    implements $SpotMonthResponseCopyWith<$Res> {
  factory _$$SpotMonthResponseImplCopyWith(_$SpotMonthResponseImpl value,
          $Res Function(_$SpotMonthResponseImpl) then) =
      __$$SpotMonthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int spotId,
      int placeId,
      String title,
      String address,
      String detailAddress,
      double mapX,
      double mapY,
      bool visited});
}

/// @nodoc
class __$$SpotMonthResponseImplCopyWithImpl<$Res>
    extends _$SpotMonthResponseCopyWithImpl<$Res, _$SpotMonthResponseImpl>
    implements _$$SpotMonthResponseImplCopyWith<$Res> {
  __$$SpotMonthResponseImplCopyWithImpl(_$SpotMonthResponseImpl _value,
      $Res Function(_$SpotMonthResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpotMonthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotId = null,
    Object? placeId = null,
    Object? title = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? mapX = null,
    Object? mapY = null,
    Object? visited = null,
  }) {
    return _then(_$SpotMonthResponseImpl(
      spotId: null == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mapX: null == mapX
          ? _value.mapX
          : mapX // ignore: cast_nullable_to_non_nullable
              as double,
      mapY: null == mapY
          ? _value.mapY
          : mapY // ignore: cast_nullable_to_non_nullable
              as double,
      visited: null == visited
          ? _value.visited
          : visited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotMonthResponseImpl implements _SpotMonthResponse {
  const _$SpotMonthResponseImpl(
      {required this.spotId,
      required this.placeId,
      required this.title,
      required this.address,
      required this.detailAddress,
      required this.mapX,
      required this.mapY,
      required this.visited});

  factory _$SpotMonthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotMonthResponseImplFromJson(json);

  @override
  final int spotId;
  @override
  final int placeId;
  @override
  final String title;
  @override
  final String address;
  @override
  final String detailAddress;
  @override
  final double mapX;
  @override
  final double mapY;
  @override
  final bool visited;

  @override
  String toString() {
    return 'SpotMonthResponse(spotId: $spotId, placeId: $placeId, title: $title, address: $address, detailAddress: $detailAddress, mapX: $mapX, mapY: $mapY, visited: $visited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotMonthResponseImpl &&
            (identical(other.spotId, spotId) || other.spotId == spotId) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.mapX, mapX) || other.mapX == mapX) &&
            (identical(other.mapY, mapY) || other.mapY == mapY) &&
            (identical(other.visited, visited) || other.visited == visited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, spotId, placeId, title, address,
      detailAddress, mapX, mapY, visited);

  /// Create a copy of SpotMonthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotMonthResponseImplCopyWith<_$SpotMonthResponseImpl> get copyWith =>
      __$$SpotMonthResponseImplCopyWithImpl<_$SpotMonthResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotMonthResponseImplToJson(
      this,
    );
  }
}

abstract class _SpotMonthResponse implements SpotMonthResponse {
  const factory _SpotMonthResponse(
      {required final int spotId,
      required final int placeId,
      required final String title,
      required final String address,
      required final String detailAddress,
      required final double mapX,
      required final double mapY,
      required final bool visited}) = _$SpotMonthResponseImpl;

  factory _SpotMonthResponse.fromJson(Map<String, dynamic> json) =
      _$SpotMonthResponseImpl.fromJson;

  @override
  int get spotId;
  @override
  int get placeId;
  @override
  String get title;
  @override
  String get address;
  @override
  String get detailAddress;
  @override
  double get mapX;
  @override
  double get mapY;
  @override
  bool get visited;

  /// Create a copy of SpotMonthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotMonthResponseImplCopyWith<_$SpotMonthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
