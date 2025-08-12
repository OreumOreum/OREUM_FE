// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeRequest _$TypeRequestFromJson(Map<String, dynamic> json) {
  return _TypeRequest.fromJson(json);
}

/// @nodoc
mixin _$TypeRequest {
  String get categoryType => throw _privateConstructorUsedError;

  /// Serializes this TypeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeRequestCopyWith<TypeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeRequestCopyWith<$Res> {
  factory $TypeRequestCopyWith(
          TypeRequest value, $Res Function(TypeRequest) then) =
      _$TypeRequestCopyWithImpl<$Res, TypeRequest>;
  @useResult
  $Res call({String categoryType});
}

/// @nodoc
class _$TypeRequestCopyWithImpl<$Res, $Val extends TypeRequest>
    implements $TypeRequestCopyWith<$Res> {
  _$TypeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
  }) {
    return _then(_value.copyWith(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeRequestImplCopyWith<$Res>
    implements $TypeRequestCopyWith<$Res> {
  factory _$$TypeRequestImplCopyWith(
          _$TypeRequestImpl value, $Res Function(_$TypeRequestImpl) then) =
      __$$TypeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryType});
}

/// @nodoc
class __$$TypeRequestImplCopyWithImpl<$Res>
    extends _$TypeRequestCopyWithImpl<$Res, _$TypeRequestImpl>
    implements _$$TypeRequestImplCopyWith<$Res> {
  __$$TypeRequestImplCopyWithImpl(
      _$TypeRequestImpl _value, $Res Function(_$TypeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
  }) {
    return _then(_$TypeRequestImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeRequestImpl implements _TypeRequest {
  const _$TypeRequestImpl({required this.categoryType});

  factory _$TypeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeRequestImplFromJson(json);

  @override
  final String categoryType;

  @override
  String toString() {
    return 'TypeRequest(categoryType: $categoryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeRequestImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryType);

  /// Create a copy of TypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeRequestImplCopyWith<_$TypeRequestImpl> get copyWith =>
      __$$TypeRequestImplCopyWithImpl<_$TypeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeRequestImplToJson(
      this,
    );
  }
}

abstract class _TypeRequest implements TypeRequest {
  const factory _TypeRequest({required final String categoryType}) =
      _$TypeRequestImpl;

  factory _TypeRequest.fromJson(Map<String, dynamic> json) =
      _$TypeRequestImpl.fromJson;

  @override
  String get categoryType;

  /// Create a copy of TypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeRequestImplCopyWith<_$TypeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
