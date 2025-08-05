// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderRequest _$FolderRequestFromJson(Map<String, dynamic> json) {
  return _FolderRequest.fromJson(json);
}

/// @nodoc
mixin _$FolderRequest {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this FolderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderRequestCopyWith<FolderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderRequestCopyWith<$Res> {
  factory $FolderRequestCopyWith(
          FolderRequest value, $Res Function(FolderRequest) then) =
      _$FolderRequestCopyWithImpl<$Res, FolderRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$FolderRequestCopyWithImpl<$Res, $Val extends FolderRequest>
    implements $FolderRequestCopyWith<$Res> {
  _$FolderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderRequestImplCopyWith<$Res>
    implements $FolderRequestCopyWith<$Res> {
  factory _$$FolderRequestImplCopyWith(
          _$FolderRequestImpl value, $Res Function(_$FolderRequestImpl) then) =
      __$$FolderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$FolderRequestImplCopyWithImpl<$Res>
    extends _$FolderRequestCopyWithImpl<$Res, _$FolderRequestImpl>
    implements _$$FolderRequestImplCopyWith<$Res> {
  __$$FolderRequestImplCopyWithImpl(
      _$FolderRequestImpl _value, $Res Function(_$FolderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FolderRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderRequestImpl implements _FolderRequest {
  const _$FolderRequestImpl({required this.name});

  factory _$FolderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'FolderRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of FolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderRequestImplCopyWith<_$FolderRequestImpl> get copyWith =>
      __$$FolderRequestImplCopyWithImpl<_$FolderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderRequestImplToJson(
      this,
    );
  }
}

abstract class _FolderRequest implements FolderRequest {
  const factory _FolderRequest({required final String name}) =
      _$FolderRequestImpl;

  factory _FolderRequest.fromJson(Map<String, dynamic> json) =
      _$FolderRequestImpl.fromJson;

  @override
  String get name;

  /// Create a copy of FolderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderRequestImplCopyWith<_$FolderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
