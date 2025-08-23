// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewListResponse _$ReviewListResponseFromJson(Map<String, dynamic> json) {
  return _ReviewListResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewListResponse {
  List<ReviewResponse> get reviews => throw _privateConstructorUsedError;
  double get average => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;

  /// Serializes this ReviewListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewListResponseCopyWith<ReviewListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListResponseCopyWith<$Res> {
  factory $ReviewListResponseCopyWith(
          ReviewListResponse value, $Res Function(ReviewListResponse) then) =
      _$ReviewListResponseCopyWithImpl<$Res, ReviewListResponse>;
  @useResult
  $Res call(
      {List<ReviewResponse> reviews,
      double average,
      int total,
      bool isLastPage});
}

/// @nodoc
class _$ReviewListResponseCopyWithImpl<$Res, $Val extends ReviewListResponse>
    implements $ReviewListResponseCopyWith<$Res> {
  _$ReviewListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? average = null,
    Object? total = null,
    Object? isLastPage = null,
  }) {
    return _then(_value.copyWith(
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewListResponseImplCopyWith<$Res>
    implements $ReviewListResponseCopyWith<$Res> {
  factory _$$ReviewListResponseImplCopyWith(_$ReviewListResponseImpl value,
          $Res Function(_$ReviewListResponseImpl) then) =
      __$$ReviewListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReviewResponse> reviews,
      double average,
      int total,
      bool isLastPage});
}

/// @nodoc
class __$$ReviewListResponseImplCopyWithImpl<$Res>
    extends _$ReviewListResponseCopyWithImpl<$Res, _$ReviewListResponseImpl>
    implements _$$ReviewListResponseImplCopyWith<$Res> {
  __$$ReviewListResponseImplCopyWithImpl(_$ReviewListResponseImpl _value,
      $Res Function(_$ReviewListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? average = null,
    Object? total = null,
    Object? isLastPage = null,
  }) {
    return _then(_$ReviewListResponseImpl(
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewListResponseImpl implements _ReviewListResponse {
  const _$ReviewListResponseImpl(
      {required final List<ReviewResponse> reviews,
      required this.average,
      required this.total,
      required this.isLastPage})
      : _reviews = reviews;

  factory _$ReviewListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewListResponseImplFromJson(json);

  final List<ReviewResponse> _reviews;
  @override
  List<ReviewResponse> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final double average;
  @override
  final int total;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'ReviewListResponse(reviews: $reviews, average: $average, total: $total, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewListResponseImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reviews),
      average,
      total,
      isLastPage);

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewListResponseImplCopyWith<_$ReviewListResponseImpl> get copyWith =>
      __$$ReviewListResponseImplCopyWithImpl<_$ReviewListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewListResponseImplToJson(
      this,
    );
  }
}

abstract class _ReviewListResponse implements ReviewListResponse {
  const factory _ReviewListResponse(
      {required final List<ReviewResponse> reviews,
      required final double average,
      required final int total,
      required final bool isLastPage}) = _$ReviewListResponseImpl;

  factory _ReviewListResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewListResponseImpl.fromJson;

  @override
  List<ReviewResponse> get reviews;
  @override
  double get average;
  @override
  int get total;
  @override
  bool get isLastPage;

  /// Create a copy of ReviewListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewListResponseImplCopyWith<_$ReviewListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
