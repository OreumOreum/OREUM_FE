// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vilage_fcst_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VilageFcstItem _$VilageFcstItemFromJson(Map<String, dynamic> json) {
  return _VilageFcstItem.fromJson(json);
}

/// @nodoc
mixin _$VilageFcstItem {
  String get category => throw _privateConstructorUsedError;
  String get fcstDate => throw _privateConstructorUsedError;
  String get fcstTime => throw _privateConstructorUsedError;
  String get fcstValue => throw _privateConstructorUsedError;

  /// Serializes this VilageFcstItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VilageFcstItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VilageFcstItemCopyWith<VilageFcstItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VilageFcstItemCopyWith<$Res> {
  factory $VilageFcstItemCopyWith(
          VilageFcstItem value, $Res Function(VilageFcstItem) then) =
      _$VilageFcstItemCopyWithImpl<$Res, VilageFcstItem>;
  @useResult
  $Res call(
      {String category, String fcstDate, String fcstTime, String fcstValue});
}

/// @nodoc
class _$VilageFcstItemCopyWithImpl<$Res, $Val extends VilageFcstItem>
    implements $VilageFcstItemCopyWith<$Res> {
  _$VilageFcstItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VilageFcstItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? fcstDate = null,
    Object? fcstTime = null,
    Object? fcstValue = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fcstDate: null == fcstDate
          ? _value.fcstDate
          : fcstDate // ignore: cast_nullable_to_non_nullable
              as String,
      fcstTime: null == fcstTime
          ? _value.fcstTime
          : fcstTime // ignore: cast_nullable_to_non_nullable
              as String,
      fcstValue: null == fcstValue
          ? _value.fcstValue
          : fcstValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VilageFcstItemImplCopyWith<$Res>
    implements $VilageFcstItemCopyWith<$Res> {
  factory _$$VilageFcstItemImplCopyWith(_$VilageFcstItemImpl value,
          $Res Function(_$VilageFcstItemImpl) then) =
      __$$VilageFcstItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category, String fcstDate, String fcstTime, String fcstValue});
}

/// @nodoc
class __$$VilageFcstItemImplCopyWithImpl<$Res>
    extends _$VilageFcstItemCopyWithImpl<$Res, _$VilageFcstItemImpl>
    implements _$$VilageFcstItemImplCopyWith<$Res> {
  __$$VilageFcstItemImplCopyWithImpl(
      _$VilageFcstItemImpl _value, $Res Function(_$VilageFcstItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of VilageFcstItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? fcstDate = null,
    Object? fcstTime = null,
    Object? fcstValue = null,
  }) {
    return _then(_$VilageFcstItemImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fcstDate: null == fcstDate
          ? _value.fcstDate
          : fcstDate // ignore: cast_nullable_to_non_nullable
              as String,
      fcstTime: null == fcstTime
          ? _value.fcstTime
          : fcstTime // ignore: cast_nullable_to_non_nullable
              as String,
      fcstValue: null == fcstValue
          ? _value.fcstValue
          : fcstValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VilageFcstItemImpl implements _VilageFcstItem {
  const _$VilageFcstItemImpl(
      {required this.category,
      required this.fcstDate,
      required this.fcstTime,
      required this.fcstValue});

  factory _$VilageFcstItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VilageFcstItemImplFromJson(json);

  @override
  final String category;
  @override
  final String fcstDate;
  @override
  final String fcstTime;
  @override
  final String fcstValue;

  @override
  String toString() {
    return 'VilageFcstItem(category: $category, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VilageFcstItemImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fcstDate, fcstDate) ||
                other.fcstDate == fcstDate) &&
            (identical(other.fcstTime, fcstTime) ||
                other.fcstTime == fcstTime) &&
            (identical(other.fcstValue, fcstValue) ||
                other.fcstValue == fcstValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, fcstDate, fcstTime, fcstValue);

  /// Create a copy of VilageFcstItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VilageFcstItemImplCopyWith<_$VilageFcstItemImpl> get copyWith =>
      __$$VilageFcstItemImplCopyWithImpl<_$VilageFcstItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VilageFcstItemImplToJson(
      this,
    );
  }
}

abstract class _VilageFcstItem implements VilageFcstItem {
  const factory _VilageFcstItem(
      {required final String category,
      required final String fcstDate,
      required final String fcstTime,
      required final String fcstValue}) = _$VilageFcstItemImpl;

  factory _VilageFcstItem.fromJson(Map<String, dynamic> json) =
      _$VilageFcstItemImpl.fromJson;

  @override
  String get category;
  @override
  String get fcstDate;
  @override
  String get fcstTime;
  @override
  String get fcstValue;

  /// Create a copy of VilageFcstItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VilageFcstItemImplCopyWith<_$VilageFcstItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
