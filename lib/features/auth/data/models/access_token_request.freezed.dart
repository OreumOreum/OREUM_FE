// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessTokenRequest _$AccessTokenRequestFromJson(Map<String, dynamic> json) {
  return _AccessTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$AccessTokenRequest {
  @JsonKey(name: 'accessToken')
  String get accessToken => throw _privateConstructorUsedError;

  /// Serializes this AccessTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessTokenRequestCopyWith<AccessTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTokenRequestCopyWith<$Res> {
  factory $AccessTokenRequestCopyWith(
          AccessTokenRequest value, $Res Function(AccessTokenRequest) then) =
      _$AccessTokenRequestCopyWithImpl<$Res, AccessTokenRequest>;
  @useResult
  $Res call({@JsonKey(name: 'accessToken') String accessToken});
}

/// @nodoc
class _$AccessTokenRequestCopyWithImpl<$Res, $Val extends AccessTokenRequest>
    implements $AccessTokenRequestCopyWith<$Res> {
  _$AccessTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessTokenRequestImplCopyWith<$Res>
    implements $AccessTokenRequestCopyWith<$Res> {
  factory _$$AccessTokenRequestImplCopyWith(_$AccessTokenRequestImpl value,
          $Res Function(_$AccessTokenRequestImpl) then) =
      __$$AccessTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'accessToken') String accessToken});
}

/// @nodoc
class __$$AccessTokenRequestImplCopyWithImpl<$Res>
    extends _$AccessTokenRequestCopyWithImpl<$Res, _$AccessTokenRequestImpl>
    implements _$$AccessTokenRequestImplCopyWith<$Res> {
  __$$AccessTokenRequestImplCopyWithImpl(_$AccessTokenRequestImpl _value,
      $Res Function(_$AccessTokenRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccessTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$AccessTokenRequestImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessTokenRequestImpl implements _AccessTokenRequest {
  const _$AccessTokenRequestImpl(
      {@JsonKey(name: 'accessToken') required this.accessToken});

  factory _$AccessTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessTokenRequestImplFromJson(json);

  @override
  @JsonKey(name: 'accessToken')
  final String accessToken;

  @override
  String toString() {
    return 'AccessTokenRequest(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessTokenRequestImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of AccessTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessTokenRequestImplCopyWith<_$AccessTokenRequestImpl> get copyWith =>
      __$$AccessTokenRequestImplCopyWithImpl<_$AccessTokenRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _AccessTokenRequest implements AccessTokenRequest {
  const factory _AccessTokenRequest(
          {@JsonKey(name: 'accessToken') required final String accessToken}) =
      _$AccessTokenRequestImpl;

  factory _AccessTokenRequest.fromJson(Map<String, dynamic> json) =
      _$AccessTokenRequestImpl.fromJson;

  @override
  @JsonKey(name: 'accessToken')
  String get accessToken;

  /// Create a copy of AccessTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessTokenRequestImplCopyWith<_$AccessTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
