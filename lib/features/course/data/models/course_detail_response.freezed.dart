// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseDetailResponse _$CourseDetailResponseFromJson(Map<String, dynamic> json) {
  return _CourseDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseDetailResponse {
  String get title => throw _privateConstructorUsedError;
  String get middleCategory => throw _privateConstructorUsedError;
  int? get sigunguCode => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get originImage => throw _privateConstructorUsedError;
  double get averageRate => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  List<Place> get places => throw _privateConstructorUsedError;

  /// Serializes this CourseDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDetailResponseCopyWith<CourseDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailResponseCopyWith<$Res> {
  factory $CourseDetailResponseCopyWith(CourseDetailResponse value,
          $Res Function(CourseDetailResponse) then) =
      _$CourseDetailResponseCopyWithImpl<$Res, CourseDetailResponse>;
  @useResult
  $Res call(
      {String title,
      String middleCategory,
      int? sigunguCode,
      String? overview,
      String? originImage,
      double averageRate,
      int reviewCount,
      List<Place> places});
}

/// @nodoc
class _$CourseDetailResponseCopyWithImpl<$Res,
        $Val extends CourseDetailResponse>
    implements $CourseDetailResponseCopyWith<$Res> {
  _$CourseDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? middleCategory = null,
    Object? sigunguCode = freezed,
    Object? overview = freezed,
    Object? originImage = freezed,
    Object? averageRate = null,
    Object? reviewCount = null,
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      middleCategory: null == middleCategory
          ? _value.middleCategory
          : middleCategory // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: freezed == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRate: null == averageRate
          ? _value.averageRate
          : averageRate // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDetailResponseImplCopyWith<$Res>
    implements $CourseDetailResponseCopyWith<$Res> {
  factory _$$CourseDetailResponseImplCopyWith(_$CourseDetailResponseImpl value,
          $Res Function(_$CourseDetailResponseImpl) then) =
      __$$CourseDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String middleCategory,
      int? sigunguCode,
      String? overview,
      String? originImage,
      double averageRate,
      int reviewCount,
      List<Place> places});
}

/// @nodoc
class __$$CourseDetailResponseImplCopyWithImpl<$Res>
    extends _$CourseDetailResponseCopyWithImpl<$Res, _$CourseDetailResponseImpl>
    implements _$$CourseDetailResponseImplCopyWith<$Res> {
  __$$CourseDetailResponseImplCopyWithImpl(_$CourseDetailResponseImpl _value,
      $Res Function(_$CourseDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? middleCategory = null,
    Object? sigunguCode = freezed,
    Object? overview = freezed,
    Object? originImage = freezed,
    Object? averageRate = null,
    Object? reviewCount = null,
    Object? places = null,
  }) {
    return _then(_$CourseDetailResponseImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      middleCategory: null == middleCategory
          ? _value.middleCategory
          : middleCategory // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: freezed == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRate: null == averageRate
          ? _value.averageRate
          : averageRate // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailResponseImpl implements _CourseDetailResponse {
  const _$CourseDetailResponseImpl(
      {required this.title,
      required this.middleCategory,
      this.sigunguCode,
      this.overview,
      this.originImage,
      required this.averageRate,
      required this.reviewCount,
      final List<Place> places = const []})
      : _places = places;

  factory _$CourseDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailResponseImplFromJson(json);

  @override
  final String title;
  @override
  final String middleCategory;
  @override
  final int? sigunguCode;
  @override
  final String? overview;
  @override
  final String? originImage;
  @override
  final double averageRate;
  @override
  final int reviewCount;
  final List<Place> _places;
  @override
  @JsonKey()
  List<Place> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'CourseDetailResponse(title: $title, middleCategory: $middleCategory, sigunguCode: $sigunguCode, overview: $overview, originImage: $originImage, averageRate: $averageRate, reviewCount: $reviewCount, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.middleCategory, middleCategory) ||
                other.middleCategory == middleCategory) &&
            (identical(other.sigunguCode, sigunguCode) ||
                other.sigunguCode == sigunguCode) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.originImage, originImage) ||
                other.originImage == originImage) &&
            (identical(other.averageRate, averageRate) ||
                other.averageRate == averageRate) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      middleCategory,
      sigunguCode,
      overview,
      originImage,
      averageRate,
      reviewCount,
      const DeepCollectionEquality().hash(_places));

  /// Create a copy of CourseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailResponseImplCopyWith<_$CourseDetailResponseImpl>
      get copyWith =>
          __$$CourseDetailResponseImplCopyWithImpl<_$CourseDetailResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _CourseDetailResponse implements CourseDetailResponse {
  const factory _CourseDetailResponse(
      {required final String title,
      required final String middleCategory,
      final int? sigunguCode,
      final String? overview,
      final String? originImage,
      required final double averageRate,
      required final int reviewCount,
      final List<Place> places}) = _$CourseDetailResponseImpl;

  factory _CourseDetailResponse.fromJson(Map<String, dynamic> json) =
      _$CourseDetailResponseImpl.fromJson;

  @override
  String get title;
  @override
  String get middleCategory;
  @override
  int? get sigunguCode;
  @override
  String? get overview;
  @override
  String? get originImage;
  @override
  double get averageRate;
  @override
  int get reviewCount;
  @override
  List<Place> get places;

  /// Create a copy of CourseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailResponseImplCopyWith<_$CourseDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get mapX => throw _privateConstructorUsedError;
  double get mapY => throw _privateConstructorUsedError;
  String? get originImage => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;
  String? get contentTypeId => throw _privateConstructorUsedError;

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
  $Res call(
      {String title,
      String address,
      double mapX,
      double mapY,
      String? originImage,
      String? thumbnailImage,
      String? contentTypeId});
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
    Object? title = null,
    Object? address = null,
    Object? mapX = null,
    Object? mapY = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? contentTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mapX: null == mapX
          ? _value.mapX
          : mapX // ignore: cast_nullable_to_non_nullable
              as double,
      mapY: null == mapY
          ? _value.mapY
          : mapY // ignore: cast_nullable_to_non_nullable
              as double,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentTypeId: freezed == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String title,
      String address,
      double mapX,
      double mapY,
      String? originImage,
      String? thumbnailImage,
      String? contentTypeId});
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
    Object? title = null,
    Object? address = null,
    Object? mapX = null,
    Object? mapY = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? contentTypeId = freezed,
  }) {
    return _then(_$PlaceImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mapX: null == mapX
          ? _value.mapX
          : mapX // ignore: cast_nullable_to_non_nullable
              as double,
      mapY: null == mapY
          ? _value.mapY
          : mapY // ignore: cast_nullable_to_non_nullable
              as double,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contentTypeId: freezed == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl implements _Place {
  const _$PlaceImpl(
      {required this.title,
      required this.address,
      required this.mapX,
      required this.mapY,
      required this.originImage,
      required this.thumbnailImage,
      required this.contentTypeId});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String title;
  @override
  final String address;
  @override
  final double mapX;
  @override
  final double mapY;
  @override
  final String? originImage;
  @override
  final String? thumbnailImage;
  @override
  final String? contentTypeId;

  @override
  String toString() {
    return 'Place(title: $title, address: $address, mapX: $mapX, mapY: $mapY, originImage: $originImage, thumbnailImage: $thumbnailImage, contentTypeId: $contentTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mapX, mapX) || other.mapX == mapX) &&
            (identical(other.mapY, mapY) || other.mapY == mapY) &&
            (identical(other.originImage, originImage) ||
                other.originImage == originImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, address, mapX, mapY,
      originImage, thumbnailImage, contentTypeId);

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
      {required final String title,
      required final String address,
      required final double mapX,
      required final double mapY,
      required final String? originImage,
      required final String? thumbnailImage,
      required final String? contentTypeId}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get title;
  @override
  String get address;
  @override
  double get mapX;
  @override
  double get mapY;
  @override
  String? get originImage;
  @override
  String? get thumbnailImage;
  @override
  String? get contentTypeId;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
