// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyInfoResponse _$MyInfoResponseFromJson(Map<String, dynamic> json) {
  return _MyInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$MyInfoResponse {
  int get id => throw _privateConstructorUsedError;
  String get loginId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  String? get categoryType => throw _privateConstructorUsedError;

  /// Serializes this MyInfoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyInfoResponseCopyWith<MyInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyInfoResponseCopyWith<$Res> {
  factory $MyInfoResponseCopyWith(
          MyInfoResponse value, $Res Function(MyInfoResponse) then) =
      _$MyInfoResponseCopyWithImpl<$Res, MyInfoResponse>;
  @useResult
  $Res call(
      {int id,
      String loginId,
      String? name,
      String? email,
      String? phoneNo,
      String? categoryType});
}

/// @nodoc
class _$MyInfoResponseCopyWithImpl<$Res, $Val extends MyInfoResponse>
    implements $MyInfoResponseCopyWith<$Res> {
  _$MyInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loginId = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? categoryType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyInfoResponseImplCopyWith<$Res>
    implements $MyInfoResponseCopyWith<$Res> {
  factory _$$MyInfoResponseImplCopyWith(_$MyInfoResponseImpl value,
          $Res Function(_$MyInfoResponseImpl) then) =
      __$$MyInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String loginId,
      String? name,
      String? email,
      String? phoneNo,
      String? categoryType});
}

/// @nodoc
class __$$MyInfoResponseImplCopyWithImpl<$Res>
    extends _$MyInfoResponseCopyWithImpl<$Res, _$MyInfoResponseImpl>
    implements _$$MyInfoResponseImplCopyWith<$Res> {
  __$$MyInfoResponseImplCopyWithImpl(
      _$MyInfoResponseImpl _value, $Res Function(_$MyInfoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? loginId = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNo = freezed,
    Object? categoryType = freezed,
  }) {
    return _then(_$MyInfoResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryType: freezed == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyInfoResponseImpl implements _MyInfoResponse {
  const _$MyInfoResponseImpl(
      {required this.id,
      required this.loginId,
      this.name,
      this.email,
      this.phoneNo,
      this.categoryType});

  factory _$MyInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyInfoResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String loginId;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phoneNo;
  @override
  final String? categoryType;

  @override
  String toString() {
    return 'MyInfoResponse(id: $id, loginId: $loginId, name: $name, email: $email, phoneNo: $phoneNo, categoryType: $categoryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyInfoResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, loginId, name, email, phoneNo, categoryType);

  /// Create a copy of MyInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyInfoResponseImplCopyWith<_$MyInfoResponseImpl> get copyWith =>
      __$$MyInfoResponseImplCopyWithImpl<_$MyInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _MyInfoResponse implements MyInfoResponse {
  const factory _MyInfoResponse(
      {required final int id,
      required final String loginId,
      final String? name,
      final String? email,
      final String? phoneNo,
      final String? categoryType}) = _$MyInfoResponseImpl;

  factory _MyInfoResponse.fromJson(Map<String, dynamic> json) =
      _$MyInfoResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get loginId;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phoneNo;
  @override
  String? get categoryType;

  /// Create a copy of MyInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyInfoResponseImplCopyWith<_$MyInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
