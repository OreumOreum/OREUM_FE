// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpotResponse _$SpotResponseFromJson(Map<String, dynamic> json) {
  return _SpotResponse.fromJson(json);
}

/// @nodoc
mixin _$SpotResponse {
  String get month => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this SpotResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpotResponseCopyWith<SpotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotResponseCopyWith<$Res> {
  factory $SpotResponseCopyWith(
          SpotResponse value, $Res Function(SpotResponse) then) =
      _$SpotResponseCopyWithImpl<$Res, SpotResponse>;
  @useResult
  $Res call({String month, int order});
}

/// @nodoc
class _$SpotResponseCopyWithImpl<$Res, $Val extends SpotResponse>
    implements $SpotResponseCopyWith<$Res> {
  _$SpotResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotResponseImplCopyWith<$Res>
    implements $SpotResponseCopyWith<$Res> {
  factory _$$SpotResponseImplCopyWith(
          _$SpotResponseImpl value, $Res Function(_$SpotResponseImpl) then) =
      __$$SpotResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, int order});
}

/// @nodoc
class __$$SpotResponseImplCopyWithImpl<$Res>
    extends _$SpotResponseCopyWithImpl<$Res, _$SpotResponseImpl>
    implements _$$SpotResponseImplCopyWith<$Res> {
  __$$SpotResponseImplCopyWithImpl(
      _$SpotResponseImpl _value, $Res Function(_$SpotResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? order = null,
  }) {
    return _then(_$SpotResponseImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpotResponseImpl implements _SpotResponse {
  const _$SpotResponseImpl({required this.month, required this.order});

  factory _$SpotResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpotResponseImplFromJson(json);

  @override
  final String month;
  @override
  final int order;

  @override
  String toString() {
    return 'SpotResponse(month: $month, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotResponseImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, order);

  /// Create a copy of SpotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotResponseImplCopyWith<_$SpotResponseImpl> get copyWith =>
      __$$SpotResponseImplCopyWithImpl<_$SpotResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpotResponseImplToJson(
      this,
    );
  }
}

abstract class _SpotResponse implements SpotResponse {
  const factory _SpotResponse(
      {required final String month,
      required final int order}) = _$SpotResponseImpl;

  factory _SpotResponse.fromJson(Map<String, dynamic> json) =
      _$SpotResponseImpl.fromJson;

  @override
  String get month;
  @override
  int get order;

  /// Create a copy of SpotResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpotResponseImplCopyWith<_$SpotResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
