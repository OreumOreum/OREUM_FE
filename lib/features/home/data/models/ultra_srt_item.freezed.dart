// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ultra_srt_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UltraSrtItem _$UltraSrtItemFromJson(Map<String, dynamic> json) {
  return _UltraSrtItem.fromJson(json);
}

/// @nodoc
mixin _$UltraSrtItem {
  String get baseDate => throw _privateConstructorUsedError;
  String get baseTime => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get nx => throw _privateConstructorUsedError;
  int get ny => throw _privateConstructorUsedError;
  String get obsrValue => throw _privateConstructorUsedError;

  /// Serializes this UltraSrtItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UltraSrtItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UltraSrtItemCopyWith<UltraSrtItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UltraSrtItemCopyWith<$Res> {
  factory $UltraSrtItemCopyWith(
          UltraSrtItem value, $Res Function(UltraSrtItem) then) =
      _$UltraSrtItemCopyWithImpl<$Res, UltraSrtItem>;
  @useResult
  $Res call(
      {String baseDate,
      String baseTime,
      String category,
      int nx,
      int ny,
      String obsrValue});
}

/// @nodoc
class _$UltraSrtItemCopyWithImpl<$Res, $Val extends UltraSrtItem>
    implements $UltraSrtItemCopyWith<$Res> {
  _$UltraSrtItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UltraSrtItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDate = null,
    Object? baseTime = null,
    Object? category = null,
    Object? nx = null,
    Object? ny = null,
    Object? obsrValue = null,
  }) {
    return _then(_value.copyWith(
      baseDate: null == baseDate
          ? _value.baseDate
          : baseDate // ignore: cast_nullable_to_non_nullable
              as String,
      baseTime: null == baseTime
          ? _value.baseTime
          : baseTime // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      nx: null == nx
          ? _value.nx
          : nx // ignore: cast_nullable_to_non_nullable
              as int,
      ny: null == ny
          ? _value.ny
          : ny // ignore: cast_nullable_to_non_nullable
              as int,
      obsrValue: null == obsrValue
          ? _value.obsrValue
          : obsrValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UltraSrtItemImplCopyWith<$Res>
    implements $UltraSrtItemCopyWith<$Res> {
  factory _$$UltraSrtItemImplCopyWith(
          _$UltraSrtItemImpl value, $Res Function(_$UltraSrtItemImpl) then) =
      __$$UltraSrtItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseDate,
      String baseTime,
      String category,
      int nx,
      int ny,
      String obsrValue});
}

/// @nodoc
class __$$UltraSrtItemImplCopyWithImpl<$Res>
    extends _$UltraSrtItemCopyWithImpl<$Res, _$UltraSrtItemImpl>
    implements _$$UltraSrtItemImplCopyWith<$Res> {
  __$$UltraSrtItemImplCopyWithImpl(
      _$UltraSrtItemImpl _value, $Res Function(_$UltraSrtItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of UltraSrtItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDate = null,
    Object? baseTime = null,
    Object? category = null,
    Object? nx = null,
    Object? ny = null,
    Object? obsrValue = null,
  }) {
    return _then(_$UltraSrtItemImpl(
      baseDate: null == baseDate
          ? _value.baseDate
          : baseDate // ignore: cast_nullable_to_non_nullable
              as String,
      baseTime: null == baseTime
          ? _value.baseTime
          : baseTime // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      nx: null == nx
          ? _value.nx
          : nx // ignore: cast_nullable_to_non_nullable
              as int,
      ny: null == ny
          ? _value.ny
          : ny // ignore: cast_nullable_to_non_nullable
              as int,
      obsrValue: null == obsrValue
          ? _value.obsrValue
          : obsrValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UltraSrtItemImpl implements _UltraSrtItem {
  const _$UltraSrtItemImpl(
      {required this.baseDate,
      required this.baseTime,
      required this.category,
      required this.nx,
      required this.ny,
      required this.obsrValue});

  factory _$UltraSrtItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UltraSrtItemImplFromJson(json);

  @override
  final String baseDate;
  @override
  final String baseTime;
  @override
  final String category;
  @override
  final int nx;
  @override
  final int ny;
  @override
  final String obsrValue;

  @override
  String toString() {
    return 'UltraSrtItem(baseDate: $baseDate, baseTime: $baseTime, category: $category, nx: $nx, ny: $ny, obsrValue: $obsrValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UltraSrtItemImpl &&
            (identical(other.baseDate, baseDate) ||
                other.baseDate == baseDate) &&
            (identical(other.baseTime, baseTime) ||
                other.baseTime == baseTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.nx, nx) || other.nx == nx) &&
            (identical(other.ny, ny) || other.ny == ny) &&
            (identical(other.obsrValue, obsrValue) ||
                other.obsrValue == obsrValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseDate, baseTime, category, nx, ny, obsrValue);

  /// Create a copy of UltraSrtItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UltraSrtItemImplCopyWith<_$UltraSrtItemImpl> get copyWith =>
      __$$UltraSrtItemImplCopyWithImpl<_$UltraSrtItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UltraSrtItemImplToJson(
      this,
    );
  }
}

abstract class _UltraSrtItem implements UltraSrtItem {
  const factory _UltraSrtItem(
      {required final String baseDate,
      required final String baseTime,
      required final String category,
      required final int nx,
      required final int ny,
      required final String obsrValue}) = _$UltraSrtItemImpl;

  factory _UltraSrtItem.fromJson(Map<String, dynamic> json) =
      _$UltraSrtItemImpl.fromJson;

  @override
  String get baseDate;
  @override
  String get baseTime;
  @override
  String get category;
  @override
  int get nx;
  @override
  int get ny;
  @override
  String get obsrValue;

  /// Create a copy of UltraSrtItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UltraSrtItemImplCopyWith<_$UltraSrtItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
