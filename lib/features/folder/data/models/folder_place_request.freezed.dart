// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_place_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderPlaceRequest _$FolderPlaceRequestFromJson(Map<String, dynamic> json) {
  return _FolderPlaceRequest.fromJson(json);
}

/// @nodoc
mixin _$FolderPlaceRequest {
  int get placeId => throw _privateConstructorUsedError;

  /// Serializes this FolderPlaceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderPlaceRequestCopyWith<FolderPlaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderPlaceRequestCopyWith<$Res> {
  factory $FolderPlaceRequestCopyWith(
          FolderPlaceRequest value, $Res Function(FolderPlaceRequest) then) =
      _$FolderPlaceRequestCopyWithImpl<$Res, FolderPlaceRequest>;
  @useResult
  $Res call({int placeId});
}

/// @nodoc
class _$FolderPlaceRequestCopyWithImpl<$Res, $Val extends FolderPlaceRequest>
    implements $FolderPlaceRequestCopyWith<$Res> {
  _$FolderPlaceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderPlaceRequestImplCopyWith<$Res>
    implements $FolderPlaceRequestCopyWith<$Res> {
  factory _$$FolderPlaceRequestImplCopyWith(_$FolderPlaceRequestImpl value,
          $Res Function(_$FolderPlaceRequestImpl) then) =
      __$$FolderPlaceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int placeId});
}

/// @nodoc
class __$$FolderPlaceRequestImplCopyWithImpl<$Res>
    extends _$FolderPlaceRequestCopyWithImpl<$Res, _$FolderPlaceRequestImpl>
    implements _$$FolderPlaceRequestImplCopyWith<$Res> {
  __$$FolderPlaceRequestImplCopyWithImpl(_$FolderPlaceRequestImpl _value,
      $Res Function(_$FolderPlaceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
  }) {
    return _then(_$FolderPlaceRequestImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderPlaceRequestImpl implements _FolderPlaceRequest {
  const _$FolderPlaceRequestImpl({required this.placeId});

  factory _$FolderPlaceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderPlaceRequestImplFromJson(json);

  @override
  final int placeId;

  @override
  String toString() {
    return 'FolderPlaceRequest(placeId: $placeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderPlaceRequestImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId);

  /// Create a copy of FolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderPlaceRequestImplCopyWith<_$FolderPlaceRequestImpl> get copyWith =>
      __$$FolderPlaceRequestImplCopyWithImpl<_$FolderPlaceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderPlaceRequestImplToJson(
      this,
    );
  }
}

abstract class _FolderPlaceRequest implements FolderPlaceRequest {
  const factory _FolderPlaceRequest({required final int placeId}) =
      _$FolderPlaceRequestImpl;

  factory _FolderPlaceRequest.fromJson(Map<String, dynamic> json) =
      _$FolderPlaceRequestImpl.fromJson;

  @override
  int get placeId;

  /// Create a copy of FolderPlaceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderPlaceRequestImplCopyWith<_$FolderPlaceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
