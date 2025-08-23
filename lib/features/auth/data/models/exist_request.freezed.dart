// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exist_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExistRequest _$ExistRequestFromJson(Map<String, dynamic> json) {
  return _ExistRequest.fromJson(json);
}

/// @nodoc
mixin _$ExistRequest {
  String get token => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;

  /// Serializes this ExistRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExistRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExistRequestCopyWith<ExistRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExistRequestCopyWith<$Res> {
  factory $ExistRequestCopyWith(
          ExistRequest value, $Res Function(ExistRequest) then) =
      _$ExistRequestCopyWithImpl<$Res, ExistRequest>;
  @useResult
  $Res call({String token, String provider});
}

/// @nodoc
class _$ExistRequestCopyWithImpl<$Res, $Val extends ExistRequest>
    implements $ExistRequestCopyWith<$Res> {
  _$ExistRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExistRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? provider = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExistRequestImplCopyWith<$Res>
    implements $ExistRequestCopyWith<$Res> {
  factory _$$ExistRequestImplCopyWith(
          _$ExistRequestImpl value, $Res Function(_$ExistRequestImpl) then) =
      __$$ExistRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String provider});
}

/// @nodoc
class __$$ExistRequestImplCopyWithImpl<$Res>
    extends _$ExistRequestCopyWithImpl<$Res, _$ExistRequestImpl>
    implements _$$ExistRequestImplCopyWith<$Res> {
  __$$ExistRequestImplCopyWithImpl(
      _$ExistRequestImpl _value, $Res Function(_$ExistRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExistRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? provider = null,
  }) {
    return _then(_$ExistRequestImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExistRequestImpl implements _ExistRequest {
  const _$ExistRequestImpl({required this.token, required this.provider});

  factory _$ExistRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExistRequestImplFromJson(json);

  @override
  final String token;
  @override
  final String provider;

  @override
  String toString() {
    return 'ExistRequest(token: $token, provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExistRequestImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, provider);

  /// Create a copy of ExistRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExistRequestImplCopyWith<_$ExistRequestImpl> get copyWith =>
      __$$ExistRequestImplCopyWithImpl<_$ExistRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExistRequestImplToJson(
      this,
    );
  }
}

abstract class _ExistRequest implements ExistRequest {
  const factory _ExistRequest(
      {required final String token,
      required final String provider}) = _$ExistRequestImpl;

  factory _ExistRequest.fromJson(Map<String, dynamic> json) =
      _$ExistRequestImpl.fromJson;

  @override
  String get token;
  @override
  String get provider;

  /// Create a copy of ExistRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExistRequestImplCopyWith<_$ExistRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
