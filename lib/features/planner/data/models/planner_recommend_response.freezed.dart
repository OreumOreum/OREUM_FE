// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_recommend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlannerRecommendResponse _$PlannerRecommendResponseFromJson(
    Map<String, dynamic> json) {
  return _PlannerRecommendResponse.fromJson(json);
}

/// @nodoc
mixin _$PlannerRecommendResponse {
  String get plannerName => throw _privateConstructorUsedError;
  List<PlannerRecommendItem> get placeList =>
      throw _privateConstructorUsedError;

  /// Serializes this PlannerRecommendResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannerRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerRecommendResponseCopyWith<PlannerRecommendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerRecommendResponseCopyWith<$Res> {
  factory $PlannerRecommendResponseCopyWith(PlannerRecommendResponse value,
          $Res Function(PlannerRecommendResponse) then) =
      _$PlannerRecommendResponseCopyWithImpl<$Res, PlannerRecommendResponse>;
  @useResult
  $Res call({String plannerName, List<PlannerRecommendItem> placeList});
}

/// @nodoc
class _$PlannerRecommendResponseCopyWithImpl<$Res,
        $Val extends PlannerRecommendResponse>
    implements $PlannerRecommendResponseCopyWith<$Res> {
  _$PlannerRecommendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerName = null,
    Object? placeList = null,
  }) {
    return _then(_value.copyWith(
      plannerName: null == plannerName
          ? _value.plannerName
          : plannerName // ignore: cast_nullable_to_non_nullable
              as String,
      placeList: null == placeList
          ? _value.placeList
          : placeList // ignore: cast_nullable_to_non_nullable
              as List<PlannerRecommendItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerRecommendResponseImplCopyWith<$Res>
    implements $PlannerRecommendResponseCopyWith<$Res> {
  factory _$$PlannerRecommendResponseImplCopyWith(
          _$PlannerRecommendResponseImpl value,
          $Res Function(_$PlannerRecommendResponseImpl) then) =
      __$$PlannerRecommendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String plannerName, List<PlannerRecommendItem> placeList});
}

/// @nodoc
class __$$PlannerRecommendResponseImplCopyWithImpl<$Res>
    extends _$PlannerRecommendResponseCopyWithImpl<$Res,
        _$PlannerRecommendResponseImpl>
    implements _$$PlannerRecommendResponseImplCopyWith<$Res> {
  __$$PlannerRecommendResponseImplCopyWithImpl(
      _$PlannerRecommendResponseImpl _value,
      $Res Function(_$PlannerRecommendResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerName = null,
    Object? placeList = null,
  }) {
    return _then(_$PlannerRecommendResponseImpl(
      plannerName: null == plannerName
          ? _value.plannerName
          : plannerName // ignore: cast_nullable_to_non_nullable
              as String,
      placeList: null == placeList
          ? _value._placeList
          : placeList // ignore: cast_nullable_to_non_nullable
              as List<PlannerRecommendItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannerRecommendResponseImpl implements _PlannerRecommendResponse {
  const _$PlannerRecommendResponseImpl(
      {required this.plannerName,
      required final List<PlannerRecommendItem> placeList})
      : _placeList = placeList;

  factory _$PlannerRecommendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannerRecommendResponseImplFromJson(json);

  @override
  final String plannerName;
  final List<PlannerRecommendItem> _placeList;
  @override
  List<PlannerRecommendItem> get placeList {
    if (_placeList is EqualUnmodifiableListView) return _placeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placeList);
  }

  @override
  String toString() {
    return 'PlannerRecommendResponse(plannerName: $plannerName, placeList: $placeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerRecommendResponseImpl &&
            (identical(other.plannerName, plannerName) ||
                other.plannerName == plannerName) &&
            const DeepCollectionEquality()
                .equals(other._placeList, _placeList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plannerName,
      const DeepCollectionEquality().hash(_placeList));

  /// Create a copy of PlannerRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerRecommendResponseImplCopyWith<_$PlannerRecommendResponseImpl>
      get copyWith => __$$PlannerRecommendResponseImplCopyWithImpl<
          _$PlannerRecommendResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannerRecommendResponseImplToJson(
      this,
    );
  }
}

abstract class _PlannerRecommendResponse implements PlannerRecommendResponse {
  const factory _PlannerRecommendResponse(
          {required final String plannerName,
          required final List<PlannerRecommendItem> placeList}) =
      _$PlannerRecommendResponseImpl;

  factory _PlannerRecommendResponse.fromJson(Map<String, dynamic> json) =
      _$PlannerRecommendResponseImpl.fromJson;

  @override
  String get plannerName;
  @override
  List<PlannerRecommendItem> get placeList;

  /// Create a copy of PlannerRecommendResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerRecommendResponseImplCopyWith<_$PlannerRecommendResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PlannerRecommendItem _$PlannerRecommendItemFromJson(Map<String, dynamic> json) {
  return _PlannerRecommendItem.fromJson(json);
}

/// @nodoc
mixin _$PlannerRecommendItem {
  int get placeId => throw _privateConstructorUsedError;
  String get placeTitle => throw _privateConstructorUsedError;
  String? get placeAddress => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;

  /// Serializes this PlannerRecommendItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannerRecommendItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerRecommendItemCopyWith<PlannerRecommendItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerRecommendItemCopyWith<$Res> {
  factory $PlannerRecommendItemCopyWith(PlannerRecommendItem value,
          $Res Function(PlannerRecommendItem) then) =
      _$PlannerRecommendItemCopyWithImpl<$Res, PlannerRecommendItem>;
  @useResult
  $Res call(
      {int placeId,
      String placeTitle,
      String? placeAddress,
      String? thumbnailImage});
}

/// @nodoc
class _$PlannerRecommendItemCopyWithImpl<$Res,
        $Val extends PlannerRecommendItem>
    implements $PlannerRecommendItemCopyWith<$Res> {
  _$PlannerRecommendItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerRecommendItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeTitle = null,
    Object? placeAddress = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      placeTitle: null == placeTitle
          ? _value.placeTitle
          : placeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      placeAddress: freezed == placeAddress
          ? _value.placeAddress
          : placeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerRecommendItemImplCopyWith<$Res>
    implements $PlannerRecommendItemCopyWith<$Res> {
  factory _$$PlannerRecommendItemImplCopyWith(_$PlannerRecommendItemImpl value,
          $Res Function(_$PlannerRecommendItemImpl) then) =
      __$$PlannerRecommendItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int placeId,
      String placeTitle,
      String? placeAddress,
      String? thumbnailImage});
}

/// @nodoc
class __$$PlannerRecommendItemImplCopyWithImpl<$Res>
    extends _$PlannerRecommendItemCopyWithImpl<$Res, _$PlannerRecommendItemImpl>
    implements _$$PlannerRecommendItemImplCopyWith<$Res> {
  __$$PlannerRecommendItemImplCopyWithImpl(_$PlannerRecommendItemImpl _value,
      $Res Function(_$PlannerRecommendItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerRecommendItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? placeTitle = null,
    Object? placeAddress = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(_$PlannerRecommendItemImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      placeTitle: null == placeTitle
          ? _value.placeTitle
          : placeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      placeAddress: freezed == placeAddress
          ? _value.placeAddress
          : placeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannerRecommendItemImpl implements _PlannerRecommendItem {
  const _$PlannerRecommendItemImpl(
      {required this.placeId,
      required this.placeTitle,
      this.placeAddress,
      this.thumbnailImage});

  factory _$PlannerRecommendItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannerRecommendItemImplFromJson(json);

  @override
  final int placeId;
  @override
  final String placeTitle;
  @override
  final String? placeAddress;
  @override
  final String? thumbnailImage;

  @override
  String toString() {
    return 'PlannerRecommendItem(placeId: $placeId, placeTitle: $placeTitle, placeAddress: $placeAddress, thumbnailImage: $thumbnailImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerRecommendItemImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.placeTitle, placeTitle) ||
                other.placeTitle == placeTitle) &&
            (identical(other.placeAddress, placeAddress) ||
                other.placeAddress == placeAddress) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeId, placeTitle, placeAddress, thumbnailImage);

  /// Create a copy of PlannerRecommendItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerRecommendItemImplCopyWith<_$PlannerRecommendItemImpl>
      get copyWith =>
          __$$PlannerRecommendItemImplCopyWithImpl<_$PlannerRecommendItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannerRecommendItemImplToJson(
      this,
    );
  }
}

abstract class _PlannerRecommendItem implements PlannerRecommendItem {
  const factory _PlannerRecommendItem(
      {required final int placeId,
      required final String placeTitle,
      final String? placeAddress,
      final String? thumbnailImage}) = _$PlannerRecommendItemImpl;

  factory _PlannerRecommendItem.fromJson(Map<String, dynamic> json) =
      _$PlannerRecommendItemImpl.fromJson;

  @override
  int get placeId;
  @override
  String get placeTitle;
  @override
  String? get placeAddress;
  @override
  String? get thumbnailImage;

  /// Create a copy of PlannerRecommendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerRecommendItemImplCopyWith<_$PlannerRecommendItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
