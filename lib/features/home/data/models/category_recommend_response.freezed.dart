// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_recommend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryRecommendResponse _$CategoryRecommendResponseFromJson(
    Map<String, dynamic> json) {
  return _CategoryRecommendResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryRecommendResponse {
  int get placeId => throw _privateConstructorUsedError;
  String get contentId => throw _privateConstructorUsedError;
  String get contentTypeId => throw _privateConstructorUsedError;
  String get orignImage => throw _privateConstructorUsedError;

  /// Serializes this CategoryRecommendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryRecommendResponseCopyWith<CategoryRecommendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryRecommendResponseCopyWith<$Res> {
  factory $CategoryRecommendResponseCopyWith(CategoryRecommendResponse value,
          $Res Function(CategoryRecommendResponse) then) =
      _$CategoryRecommendResponseCopyWithImpl<$Res, CategoryRecommendResponse>;
  @useResult
  $Res call(
      {int placeId, String contentId, String contentTypeId, String orignImage});
}

/// @nodoc
class _$CategoryRecommendResponseCopyWithImpl<$Res,
        $Val extends CategoryRecommendResponse>
    implements $CategoryRecommendResponseCopyWith<$Res> {
  _$CategoryRecommendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? orignImage = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      orignImage: null == orignImage
          ? _value.orignImage
          : orignImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryRecommendResponseImplCopyWith<$Res>
    implements $CategoryRecommendResponseCopyWith<$Res> {
  factory _$$CategoryRecommendResponseImplCopyWith(
          _$CategoryRecommendResponseImpl value,
          $Res Function(_$CategoryRecommendResponseImpl) then) =
      __$$CategoryRecommendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int placeId, String contentId, String contentTypeId, String orignImage});
}

/// @nodoc
class __$$CategoryRecommendResponseImplCopyWithImpl<$Res>
    extends _$CategoryRecommendResponseCopyWithImpl<$Res,
        _$CategoryRecommendResponseImpl>
    implements _$$CategoryRecommendResponseImplCopyWith<$Res> {
  __$$CategoryRecommendResponseImplCopyWithImpl(
      _$CategoryRecommendResponseImpl _value,
      $Res Function(_$CategoryRecommendResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? orignImage = null,
  }) {
    return _then(_$CategoryRecommendResponseImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      contentTypeId: null == contentTypeId
          ? _value.contentTypeId
          : contentTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      orignImage: null == orignImage
          ? _value.orignImage
          : orignImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryRecommendResponseImpl implements _CategoryRecommendResponse {
  const _$CategoryRecommendResponseImpl(
      {required this.placeId,
      required this.contentId,
      required this.contentTypeId,
      required this.orignImage});

  factory _$CategoryRecommendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryRecommendResponseImplFromJson(json);

  @override
  final int placeId;
  @override
  final String contentId;
  @override
  final String contentTypeId;
  @override
  final String orignImage;

  @override
  String toString() {
    return 'CategoryRecommendResponse(placeId: $placeId, contentId: $contentId, contentTypeId: $contentTypeId, orignImage: $orignImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryRecommendResponseImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.orignImage, orignImage) ||
                other.orignImage == orignImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, contentId, contentTypeId, orignImage);

  /// Create a copy of CategoryRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryRecommendResponseImplCopyWith<_$CategoryRecommendResponseImpl>
      get copyWith => __$$CategoryRecommendResponseImplCopyWithImpl<
          _$CategoryRecommendResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryRecommendResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryRecommendResponse implements CategoryRecommendResponse {
  const factory _CategoryRecommendResponse(
      {required final int placeId,
      required final String contentId,
      required final String contentTypeId,
      required final String orignImage}) = _$CategoryRecommendResponseImpl;

  factory _CategoryRecommendResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryRecommendResponseImpl.fromJson;

  @override
  int get placeId;
  @override
  String get contentId;
  @override
  String get contentTypeId;
  @override
  String get orignImage;

  /// Create a copy of CategoryRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryRecommendResponseImplCopyWith<_$CategoryRecommendResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
