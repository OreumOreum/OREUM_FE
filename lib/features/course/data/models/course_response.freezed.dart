// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return _CourseResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get originImage => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;
  String get category2 => throw _privateConstructorUsedError;
  int? get sigunguCode => throw _privateConstructorUsedError;

  /// Serializes this CourseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseResponseCopyWith<CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseCopyWith<$Res> {
  factory $CourseResponseCopyWith(
          CourseResponse value, $Res Function(CourseResponse) then) =
      _$CourseResponseCopyWithImpl<$Res, CourseResponse>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? originImage,
      String? thumbnailImage,
      String category2,
      int? sigunguCode});
}

/// @nodoc
class _$CourseResponseCopyWithImpl<$Res, $Val extends CourseResponse>
    implements $CourseResponseCopyWith<$Res> {
  _$CourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? category2 = null,
    Object? sigunguCode = freezed,
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
      originImage: freezed == originImage
          ? _value.originImage
          : originImage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: freezed == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseResponseImplCopyWith<$Res>
    implements $CourseResponseCopyWith<$Res> {
  factory _$$CourseResponseImplCopyWith(_$CourseResponseImpl value,
          $Res Function(_$CourseResponseImpl) then) =
      __$$CourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? originImage,
      String? thumbnailImage,
      String category2,
      int? sigunguCode});
}

/// @nodoc
class __$$CourseResponseImplCopyWithImpl<$Res>
    extends _$CourseResponseCopyWithImpl<$Res, _$CourseResponseImpl>
    implements _$$CourseResponseImplCopyWith<$Res> {
  __$$CourseResponseImplCopyWithImpl(
      _$CourseResponseImpl _value, $Res Function(_$CourseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? originImage = freezed,
    Object? thumbnailImage = freezed,
    Object? category2 = null,
    Object? sigunguCode = freezed,
  }) {
    return _then(_$CourseResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as String,
      sigunguCode: freezed == sigunguCode
          ? _value.sigunguCode
          : sigunguCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseResponseImpl implements _CourseResponse {
  const _$CourseResponseImpl(
      {required this.id,
      required this.title,
      this.originImage,
      this.thumbnailImage,
      required this.category2,
      this.sigunguCode});

  factory _$CourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? originImage;
  @override
  final String? thumbnailImage;
  @override
  final String category2;
  @override
  final int? sigunguCode;

  @override
  String toString() {
    return 'CourseResponse(id: $id, title: $title, originImage: $originImage, thumbnailImage: $thumbnailImage, category2: $category2, sigunguCode: $sigunguCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originImage, originImage) ||
                other.originImage == originImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.category2, category2) ||
                other.category2 == category2) &&
            (identical(other.sigunguCode, sigunguCode) ||
                other.sigunguCode == sigunguCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, originImage,
      thumbnailImage, category2, sigunguCode);

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      __$$CourseResponseImplCopyWithImpl<_$CourseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseImplToJson(
      this,
    );
  }
}

abstract class _CourseResponse implements CourseResponse {
  const factory _CourseResponse(
      {required final int id,
      required final String title,
      final String? originImage,
      final String? thumbnailImage,
      required final String category2,
      final int? sigunguCode}) = _$CourseResponseImpl;

  factory _CourseResponse.fromJson(Map<String, dynamic> json) =
      _$CourseResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get originImage;
  @override
  String? get thumbnailImage;
  @override
  String get category2;
  @override
  int? get sigunguCode;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
