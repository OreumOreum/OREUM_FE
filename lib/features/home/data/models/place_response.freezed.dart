// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageablePlaceResponse _$PageablePlaceResponseFromJson(
    Map<String, dynamic> json) {
  return _PageablePlaceResponse.fromJson(json);
}

/// @nodoc
mixin _$PageablePlaceResponse {
  @JsonKey(name: 'places')
  List<Place> get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLastPage')
  bool get last => throw _privateConstructorUsedError;

  /// Serializes this PageablePlaceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageablePlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageablePlaceResponseCopyWith<PageablePlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageablePlaceResponseCopyWith<$Res> {
  factory $PageablePlaceResponseCopyWith(PageablePlaceResponse value,
          $Res Function(PageablePlaceResponse) then) =
      _$PageablePlaceResponseCopyWithImpl<$Res, PageablePlaceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'places') List<Place> content,
      @JsonKey(name: 'isLastPage') bool last});
}

/// @nodoc
class _$PageablePlaceResponseCopyWithImpl<$Res,
        $Val extends PageablePlaceResponse>
    implements $PageablePlaceResponseCopyWith<$Res> {
  _$PageablePlaceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageablePlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? last = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageablePlaceResponseImplCopyWith<$Res>
    implements $PageablePlaceResponseCopyWith<$Res> {
  factory _$$PageablePlaceResponseImplCopyWith(
          _$PageablePlaceResponseImpl value,
          $Res Function(_$PageablePlaceResponseImpl) then) =
      __$$PageablePlaceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'places') List<Place> content,
      @JsonKey(name: 'isLastPage') bool last});
}

/// @nodoc
class __$$PageablePlaceResponseImplCopyWithImpl<$Res>
    extends _$PageablePlaceResponseCopyWithImpl<$Res,
        _$PageablePlaceResponseImpl>
    implements _$$PageablePlaceResponseImplCopyWith<$Res> {
  __$$PageablePlaceResponseImplCopyWithImpl(_$PageablePlaceResponseImpl _value,
      $Res Function(_$PageablePlaceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageablePlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? last = null,
  }) {
    return _then(_$PageablePlaceResponseImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageablePlaceResponseImpl implements _PageablePlaceResponse {
  const _$PageablePlaceResponseImpl(
      {@JsonKey(name: 'places') required final List<Place> content,
      @JsonKey(name: 'isLastPage') required this.last})
      : _content = content;

  factory _$PageablePlaceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageablePlaceResponseImplFromJson(json);

  final List<Place> _content;
  @override
  @JsonKey(name: 'places')
  List<Place> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  @JsonKey(name: 'isLastPage')
  final bool last;

  @override
  String toString() {
    return 'PageablePlaceResponse(content: $content, last: $last)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageablePlaceResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_content), last);

  /// Create a copy of PageablePlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageablePlaceResponseImplCopyWith<_$PageablePlaceResponseImpl>
      get copyWith => __$$PageablePlaceResponseImplCopyWithImpl<
          _$PageablePlaceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageablePlaceResponseImplToJson(
      this,
    );
  }
}

abstract class _PageablePlaceResponse implements PageablePlaceResponse {
  const factory _PageablePlaceResponse(
          {@JsonKey(name: 'places') required final List<Place> content,
          @JsonKey(name: 'isLastPage') required final bool last}) =
      _$PageablePlaceResponseImpl;

  factory _PageablePlaceResponse.fromJson(Map<String, dynamic> json) =
      _$PageablePlaceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'places')
  List<Place> get content;
  @override
  @JsonKey(name: 'isLastPage')
  bool get last;

  /// Create a copy of PageablePlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageablePlaceResponseImplCopyWith<_$PageablePlaceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  @JsonKey(name: 'id')
  int get placeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get originImage => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;
  int get sigunguCode => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  String? get contentId => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'id') int placeId,
      String title,
      String? originImage,
      String? thumbnailImage,
      int sigunguCode,
      bool isSaved,
      String? contentId,
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
    Object? placeId = null,
    Object? title = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? sigunguCode = null,
    Object? isSaved = null,
    Object? contentId = freezed,
    Object? contentTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      sigunguCode: null == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') int placeId,
      String title,
      String? originImage,
      String? thumbnailImage,
      int sigunguCode,
      bool isSaved,
      String? contentId,
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
    Object? placeId = null,
    Object? title = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? sigunguCode = null,
    Object? isSaved = null,
    Object? contentId = freezed,
    Object? contentTypeId = freezed,
  }) {
    return _then(_$PlaceImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      sigunguCode: null == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id') required this.placeId,
      required this.title,
      this.originImage,
      this.thumbnailImage,
      required this.sigunguCode,
      required this.isSaved,
      this.contentId,
      this.contentTypeId});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int placeId;
  @override
  final String title;
  @override
  final String? originImage;
  @override
  final String? thumbnailImage;
  @override
  final int sigunguCode;
  @override
  final bool isSaved;
  @override
  final String? contentId;
  @override
  final String? contentTypeId;

  @override
  String toString() {
    return 'Place(placeId: $placeId, title: $title, originImage: $originImage, thumbnailImage: $thumbnailImage, sigunguCode: $sigunguCode, isSaved: $isSaved, contentId: $contentId, contentTypeId: $contentTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originImage, originImage) ||
                other.originImage == originImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.sigunguCode, sigunguCode) ||
                other.sigunguCode == sigunguCode) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, title, originImage,
      thumbnailImage, sigunguCode, isSaved, contentId, contentTypeId);

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
      {@JsonKey(name: 'id') required final int placeId,
      required final String title,
      final String? originImage,
      final String? thumbnailImage,
      required final int sigunguCode,
      required final bool isSaved,
      final String? contentId,
      final String? contentTypeId}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get placeId;
  @override
  String get title;
  @override
  String? get originImage;
  @override
  String? get thumbnailImage;
  @override
  int get sigunguCode;
  @override
  bool get isSaved;
  @override
  String? get contentId;
  @override
  String? get contentTypeId;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
