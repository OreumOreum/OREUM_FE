// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_check_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeCheckResponse _$TypeCheckResponseFromJson(Map<String, dynamic> json) {
  return _TypeCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$TypeCheckResponse {
  bool get typeCheck => throw _privateConstructorUsedError;

  /// Serializes this TypeCheckResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeCheckResponseCopyWith<TypeCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCheckResponseCopyWith<$Res> {
  factory $TypeCheckResponseCopyWith(
          TypeCheckResponse value, $Res Function(TypeCheckResponse) then) =
      _$TypeCheckResponseCopyWithImpl<$Res, TypeCheckResponse>;
  @useResult
  $Res call({bool typeCheck});
}

/// @nodoc
class _$TypeCheckResponseCopyWithImpl<$Res, $Val extends TypeCheckResponse>
    implements $TypeCheckResponseCopyWith<$Res> {
  _$TypeCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeCheck = null,
  }) {
    return _then(_value.copyWith(
      typeCheck: null == typeCheck
          ? _value.typeCheck
          : typeCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeCheckResponseImplCopyWith<$Res>
    implements $TypeCheckResponseCopyWith<$Res> {
  factory _$$TypeCheckResponseImplCopyWith(_$TypeCheckResponseImpl value,
          $Res Function(_$TypeCheckResponseImpl) then) =
      __$$TypeCheckResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool typeCheck});
}

/// @nodoc
class __$$TypeCheckResponseImplCopyWithImpl<$Res>
    extends _$TypeCheckResponseCopyWithImpl<$Res, _$TypeCheckResponseImpl>
    implements _$$TypeCheckResponseImplCopyWith<$Res> {
  __$$TypeCheckResponseImplCopyWithImpl(_$TypeCheckResponseImpl _value,
      $Res Function(_$TypeCheckResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeCheck = null,
  }) {
    return _then(_$TypeCheckResponseImpl(
      typeCheck: null == typeCheck
          ? _value.typeCheck
          : typeCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeCheckResponseImpl implements _TypeCheckResponse {
  const _$TypeCheckResponseImpl({required this.typeCheck});

  factory _$TypeCheckResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeCheckResponseImplFromJson(json);

  @override
  final bool typeCheck;

  @override
  String toString() {
    return 'TypeCheckResponse(typeCheck: $typeCheck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeCheckResponseImpl &&
            (identical(other.typeCheck, typeCheck) ||
                other.typeCheck == typeCheck));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, typeCheck);

  /// Create a copy of TypeCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeCheckResponseImplCopyWith<_$TypeCheckResponseImpl> get copyWith =>
      __$$TypeCheckResponseImplCopyWithImpl<_$TypeCheckResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeCheckResponseImplToJson(
      this,
    );
  }
}

abstract class _TypeCheckResponse implements TypeCheckResponse {
  const factory _TypeCheckResponse({required final bool typeCheck}) =
      _$TypeCheckResponseImpl;

  factory _TypeCheckResponse.fromJson(Map<String, dynamic> json) =
      _$TypeCheckResponseImpl.fromJson;

  @override
  bool get typeCheck;

  /// Create a copy of TypeCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeCheckResponseImplCopyWith<_$TypeCheckResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
