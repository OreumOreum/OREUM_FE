// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyReviewResponse _$MyReviewResponseFromJson(Map<String, dynamic> json) {
  return _MyReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$MyReviewResponse {
  double get rate => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get placeTitle => throw _privateConstructorUsedError;
  int get reviewID => throw _privateConstructorUsedError;

  /// Serializes this MyReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyReviewResponseCopyWith<MyReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReviewResponseCopyWith<$Res> {
  factory $MyReviewResponseCopyWith(
          MyReviewResponse value, $Res Function(MyReviewResponse) then) =
      _$MyReviewResponseCopyWithImpl<$Res, MyReviewResponse>;
  @useResult
  $Res call(
      {double rate,
      String content,
      String createdAt,
      String updatedAt,
      String placeTitle,
      int reviewID});
}

/// @nodoc
class _$MyReviewResponseCopyWithImpl<$Res, $Val extends MyReviewResponse>
    implements $MyReviewResponseCopyWith<$Res> {
  _$MyReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? placeTitle = null,
    Object? reviewID = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      placeTitle: null == placeTitle
          ? _value.placeTitle
          : placeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      reviewID: null == reviewID
          ? _value.reviewID
          : reviewID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyReviewResponseImplCopyWith<$Res>
    implements $MyReviewResponseCopyWith<$Res> {
  factory _$$MyReviewResponseImplCopyWith(_$MyReviewResponseImpl value,
          $Res Function(_$MyReviewResponseImpl) then) =
      __$$MyReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rate,
      String content,
      String createdAt,
      String updatedAt,
      String placeTitle,
      int reviewID});
}

/// @nodoc
class __$$MyReviewResponseImplCopyWithImpl<$Res>
    extends _$MyReviewResponseCopyWithImpl<$Res, _$MyReviewResponseImpl>
    implements _$$MyReviewResponseImplCopyWith<$Res> {
  __$$MyReviewResponseImplCopyWithImpl(_$MyReviewResponseImpl _value,
      $Res Function(_$MyReviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? placeTitle = null,
    Object? reviewID = null,
  }) {
    return _then(_$MyReviewResponseImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      placeTitle: null == placeTitle
          ? _value.placeTitle
          : placeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      reviewID: null == reviewID
          ? _value.reviewID
          : reviewID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyReviewResponseImpl implements _MyReviewResponse {
  const _$MyReviewResponseImpl(
      {required this.rate,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.placeTitle,
      required this.reviewID});

  factory _$MyReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyReviewResponseImplFromJson(json);

  @override
  final double rate;
  @override
  final String content;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String placeTitle;
  @override
  final int reviewID;

  @override
  String toString() {
    return 'MyReviewResponse(rate: $rate, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, placeTitle: $placeTitle, reviewID: $reviewID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReviewResponseImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.placeTitle, placeTitle) ||
                other.placeTitle == placeTitle) &&
            (identical(other.reviewID, reviewID) ||
                other.reviewID == reviewID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rate, content, createdAt, updatedAt, placeTitle, reviewID);

  /// Create a copy of MyReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReviewResponseImplCopyWith<_$MyReviewResponseImpl> get copyWith =>
      __$$MyReviewResponseImplCopyWithImpl<_$MyReviewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyReviewResponseImplToJson(
      this,
    );
  }
}

abstract class _MyReviewResponse implements MyReviewResponse {
  const factory _MyReviewResponse(
      {required final double rate,
      required final String content,
      required final String createdAt,
      required final String updatedAt,
      required final String placeTitle,
      required final int reviewID}) = _$MyReviewResponseImpl;

  factory _MyReviewResponse.fromJson(Map<String, dynamic> json) =
      _$MyReviewResponseImpl.fromJson;

  @override
  double get rate;
  @override
  String get content;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String get placeTitle;
  @override
  int get reviewID;

  /// Create a copy of MyReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyReviewResponseImplCopyWith<_$MyReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
