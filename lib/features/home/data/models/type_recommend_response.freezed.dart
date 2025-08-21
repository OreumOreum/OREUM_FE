// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_recommend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeRecommendResponse _$TypeRecommendResponseFromJson(
    Map<String, dynamic> json) {
  return _TypeRecommendResponse.fromJson(json);
}

/// @nodoc
mixin _$TypeRecommendResponse {
  List<PlaceItem> get places => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;

  /// Serializes this TypeRecommendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeRecommendResponseCopyWith<TypeRecommendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeRecommendResponseCopyWith<$Res> {
  factory $TypeRecommendResponseCopyWith(TypeRecommendResponse value,
          $Res Function(TypeRecommendResponse) then) =
      _$TypeRecommendResponseCopyWithImpl<$Res, TypeRecommendResponse>;
  @useResult
  $Res call({List<PlaceItem> places, bool isLastPage});
}

/// @nodoc
class _$TypeRecommendResponseCopyWithImpl<$Res,
        $Val extends TypeRecommendResponse>
    implements $TypeRecommendResponseCopyWith<$Res> {
  _$TypeRecommendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
    Object? isLastPage = null,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceItem>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeRecommendResponseImplCopyWith<$Res>
    implements $TypeRecommendResponseCopyWith<$Res> {
  factory _$$TypeRecommendResponseImplCopyWith(
          _$TypeRecommendResponseImpl value,
          $Res Function(_$TypeRecommendResponseImpl) then) =
      __$$TypeRecommendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaceItem> places, bool isLastPage});
}

/// @nodoc
class __$$TypeRecommendResponseImplCopyWithImpl<$Res>
    extends _$TypeRecommendResponseCopyWithImpl<$Res,
        _$TypeRecommendResponseImpl>
    implements _$$TypeRecommendResponseImplCopyWith<$Res> {
  __$$TypeRecommendResponseImplCopyWithImpl(_$TypeRecommendResponseImpl _value,
      $Res Function(_$TypeRecommendResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
    Object? isLastPage = null,
  }) {
    return _then(_$TypeRecommendResponseImpl(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceItem>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeRecommendResponseImpl implements _TypeRecommendResponse {
  const _$TypeRecommendResponseImpl(
      {required final List<PlaceItem> places, required this.isLastPage})
      : _places = places;

  factory _$TypeRecommendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeRecommendResponseImplFromJson(json);

  final List<PlaceItem> _places;
  @override
  List<PlaceItem> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'TypeRecommendResponse(places: $places, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeRecommendResponseImpl &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_places), isLastPage);

  /// Create a copy of TypeRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeRecommendResponseImplCopyWith<_$TypeRecommendResponseImpl>
      get copyWith => __$$TypeRecommendResponseImplCopyWithImpl<
          _$TypeRecommendResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeRecommendResponseImplToJson(
      this,
    );
  }
}

abstract class _TypeRecommendResponse implements TypeRecommendResponse {
  const factory _TypeRecommendResponse(
      {required final List<PlaceItem> places,
      required final bool isLastPage}) = _$TypeRecommendResponseImpl;

  factory _TypeRecommendResponse.fromJson(Map<String, dynamic> json) =
      _$TypeRecommendResponseImpl.fromJson;

  @override
  List<PlaceItem> get places;
  @override
  bool get isLastPage;

  /// Create a copy of TypeRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeRecommendResponseImplCopyWith<_$TypeRecommendResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlaceItem _$PlaceItemFromJson(Map<String, dynamic> json) {
  return _PlaceItem.fromJson(json);
}

/// @nodoc
mixin _$PlaceItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contentId => throw _privateConstructorUsedError;
  String get contentTypeId => throw _privateConstructorUsedError;
  String get originImage => throw _privateConstructorUsedError;
  String get thumbnailImage => throw _privateConstructorUsedError;
  int get sigunguCode => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get detailAddress => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  /// Serializes this PlaceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceItemCopyWith<PlaceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceItemCopyWith<$Res> {
  factory $PlaceItemCopyWith(PlaceItem value, $Res Function(PlaceItem) then) =
      _$PlaceItemCopyWithImpl<$Res, PlaceItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String contentId,
      String contentTypeId,
      String originImage,
      String thumbnailImage,
      int sigunguCode,
      String address,
      String detailAddress,
      bool isSaved});
}

/// @nodoc
class _$PlaceItemCopyWithImpl<$Res, $Val extends PlaceItem>
    implements $PlaceItemCopyWith<$Res> {
  _$PlaceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? originImage = null,
    Object? thumbnailImage = null,
    Object? sigunguCode = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      originImage: null == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: null == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceItemImplCopyWith<$Res>
    implements $PlaceItemCopyWith<$Res> {
  factory _$$PlaceItemImplCopyWith(
          _$PlaceItemImpl value, $Res Function(_$PlaceItemImpl) then) =
      __$$PlaceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String contentId,
      String contentTypeId,
      String originImage,
      String thumbnailImage,
      int sigunguCode,
      String address,
      String detailAddress,
      bool isSaved});
}

/// @nodoc
class __$$PlaceItemImplCopyWithImpl<$Res>
    extends _$PlaceItemCopyWithImpl<$Res, _$PlaceItemImpl>
    implements _$$PlaceItemImplCopyWith<$Res> {
  __$$PlaceItemImplCopyWithImpl(
      _$PlaceItemImpl _value, $Res Function(_$PlaceItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? originImage = null,
    Object? thumbnailImage = null,
    Object? sigunguCode = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? isSaved = null,
  }) {
    return _then(_$PlaceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      originImage: null == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: null == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceItemImpl implements _PlaceItem {
  const _$PlaceItemImpl(
      {required this.id,
      required this.title,
      required this.contentId,
      required this.contentTypeId,
      required this.originImage,
      required this.thumbnailImage,
      required this.sigunguCode,
      required this.address,
      required this.detailAddress,
      required this.isSaved});

  factory _$PlaceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceItemImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String contentId;
  @override
  final String contentTypeId;
  @override
  final String originImage;
  @override
  final String thumbnailImage;
  @override
  final int sigunguCode;
  @override
  final String address;
  @override
  final String detailAddress;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'PlaceItem(id: $id, title: $title, contentId: $contentId, contentTypeId: $contentTypeId, originImage: $originImage, thumbnailImage: $thumbnailImage, sigunguCode: $sigunguCode, address: $address, detailAddress: $detailAddress, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.originImage, originImage) ||
                other.originImage == originImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.sigunguCode, sigunguCode) ||
                other.sigunguCode == sigunguCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      contentId,
      contentTypeId,
      originImage,
      thumbnailImage,
      sigunguCode,
      address,
      detailAddress,
      isSaved);

  /// Create a copy of PlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceItemImplCopyWith<_$PlaceItemImpl> get copyWith =>
      __$$PlaceItemImplCopyWithImpl<_$PlaceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceItemImplToJson(
      this,
    );
  }
}

abstract class _PlaceItem implements PlaceItem {
  const factory _PlaceItem(
      {required final int id,
      required final String title,
      required final String contentId,
      required final String contentTypeId,
      required final String originImage,
      required final String thumbnailImage,
      required final int sigunguCode,
      required final String address,
      required final String detailAddress,
      required final bool isSaved}) = _$PlaceItemImpl;

  factory _PlaceItem.fromJson(Map<String, dynamic> json) =
      _$PlaceItemImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get contentId;
  @override
  String get contentTypeId;
  @override
  String get originImage;
  @override
  String get thumbnailImage;
  @override
  int get sigunguCode;
  @override
  String get address;
  @override
  String get detailAddress;
  @override
  bool get isSaved;

  /// Create a copy of PlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceItemImplCopyWith<_$PlaceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
