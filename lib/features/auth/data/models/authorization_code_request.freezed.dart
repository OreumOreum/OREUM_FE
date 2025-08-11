// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorization_code_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorizationCodeRequest _$AuthorizationCodeRequestFromJson(
    Map<String, dynamic> json) {
  return _AuthorizationCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthorizationCodeRequest {
  String get authorizationCode => throw _privateConstructorUsedError;

  /// Serializes this AuthorizationCodeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorizationCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorizationCodeRequestCopyWith<AuthorizationCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationCodeRequestCopyWith<$Res> {
  factory $AuthorizationCodeRequestCopyWith(AuthorizationCodeRequest value,
          $Res Function(AuthorizationCodeRequest) then) =
      _$AuthorizationCodeRequestCopyWithImpl<$Res, AuthorizationCodeRequest>;
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class _$AuthorizationCodeRequestCopyWithImpl<$Res,
        $Val extends AuthorizationCodeRequest>
    implements $AuthorizationCodeRequestCopyWith<$Res> {
  _$AuthorizationCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorizationCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_value.copyWith(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorizationCodeRequestImplCopyWith<$Res>
    implements $AuthorizationCodeRequestCopyWith<$Res> {
  factory _$$AuthorizationCodeRequestImplCopyWith(
          _$AuthorizationCodeRequestImpl value,
          $Res Function(_$AuthorizationCodeRequestImpl) then) =
      __$$AuthorizationCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class __$$AuthorizationCodeRequestImplCopyWithImpl<$Res>
    extends _$AuthorizationCodeRequestCopyWithImpl<$Res,
        _$AuthorizationCodeRequestImpl>
    implements _$$AuthorizationCodeRequestImplCopyWith<$Res> {
  __$$AuthorizationCodeRequestImplCopyWithImpl(
      _$AuthorizationCodeRequestImpl _value,
      $Res Function(_$AuthorizationCodeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorizationCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_$AuthorizationCodeRequestImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorizationCodeRequestImpl implements _AuthorizationCodeRequest {
  const _$AuthorizationCodeRequestImpl({required this.authorizationCode});

  factory _$AuthorizationCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizationCodeRequestImplFromJson(json);

  @override
  final String authorizationCode;

  @override
  String toString() {
    return 'AuthorizationCodeRequest(authorizationCode: $authorizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationCodeRequestImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, authorizationCode);

  /// Create a copy of AuthorizationCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationCodeRequestImplCopyWith<_$AuthorizationCodeRequestImpl>
      get copyWith => __$$AuthorizationCodeRequestImplCopyWithImpl<
          _$AuthorizationCodeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizationCodeRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthorizationCodeRequest implements AuthorizationCodeRequest {
  const factory _AuthorizationCodeRequest(
          {required final String authorizationCode}) =
      _$AuthorizationCodeRequestImpl;

  factory _AuthorizationCodeRequest.fromJson(Map<String, dynamic> json) =
      _$AuthorizationCodeRequestImpl.fromJson;

  @override
  String get authorizationCode;

  /// Create a copy of AuthorizationCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizationCodeRequestImplCopyWith<_$AuthorizationCodeRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
