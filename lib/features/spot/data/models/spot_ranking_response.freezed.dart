// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_ranking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpotRankingResponse _$SpotRankingResponseFromJson(Map<String, dynamic> json) {
  return _SpotRankingResponse.fromJson(json);
}

/// @nodoc
mixin _$SpotRankingResponse {
  int get rank => throw _privateConstructorUsedError;
  String get categoryType => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;

  /// Serializes this SpotRankingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotRankingResponseCopyWith<SpotRankingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotRankingResponseCopyWith<$Res> {
  factory $SpotRankingResponseCopyWith(
          SpotRankingResponse value, $Res Function(SpotRankingResponse) then) =
      _$SpotRankingResponseCopyWithImpl<$Res, SpotRankingResponse>;
  @useResult
  $Res call({int rank, String categoryType, int visitCount});
}

/// @nodoc
class _$SpotRankingResponseCopyWithImpl<$Res, $Val extends SpotRankingResponse>
    implements $SpotRankingResponseCopyWith<$Res> {
  _$SpotRankingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? categoryType = null,
    Object? visitCount = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotRankingResponseImplCopyWith<$Res>
    implements $SpotRankingResponseCopyWith<$Res> {
  factory _$$SpotRankingResponseImplCopyWith(_$SpotRankingResponseImpl value,
          $Res Function(_$SpotRankingResponseImpl) then) =
      __$$SpotRankingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rank, String categoryType, int visitCount});
}

/// @nodoc
class __$$SpotRankingResponseImplCopyWithImpl<$Res>
    extends _$SpotRankingResponseCopyWithImpl<$Res, _$SpotRankingResponseImpl>
    implements _$$SpotRankingResponseImplCopyWith<$Res> {
  __$$SpotRankingResponseImplCopyWithImpl(_$SpotRankingResponseImpl _value,
      $Res Function(_$SpotRankingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpotRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? categoryType = null,
    Object? visitCount = null,
  }) {
    return _then(_$SpotRankingResponseImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotRankingResponseImpl implements _SpotRankingResponse {
  const _$SpotRankingResponseImpl(
      {required this.rank,
      required this.categoryType,
      required this.visitCount});

  factory _$SpotRankingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotRankingResponseImplFromJson(json);

  @override
  final int rank;
  @override
  final String categoryType;
  @override
  final int visitCount;

  @override
  String toString() {
    return 'SpotRankingResponse(rank: $rank, categoryType: $categoryType, visitCount: $visitCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotRankingResponseImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank, categoryType, visitCount);

  /// Create a copy of SpotRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotRankingResponseImplCopyWith<_$SpotRankingResponseImpl> get copyWith =>
      __$$SpotRankingResponseImplCopyWithImpl<_$SpotRankingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotRankingResponseImplToJson(
      this,
    );
  }
}

abstract class _SpotRankingResponse implements SpotRankingResponse {
  const factory _SpotRankingResponse(
      {required final int rank,
      required final String categoryType,
      required final int visitCount}) = _$SpotRankingResponseImpl;

  factory _SpotRankingResponse.fromJson(Map<String, dynamic> json) =
      _$SpotRankingResponseImpl.fromJson;

  @override
  int get rank;
  @override
  String get categoryType;
  @override
  int get visitCount;

  /// Create a copy of SpotRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotRankingResponseImplCopyWith<_$SpotRankingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
