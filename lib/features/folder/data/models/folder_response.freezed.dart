// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderResponse _$FolderResponseFromJson(Map<String, dynamic> json) {
  return _FolderResponse.fromJson(json);
}

/// @nodoc
mixin _$FolderResponse {
  int get folderId => throw _privateConstructorUsedError;
  String get folderName => throw _privateConstructorUsedError;
  List<String>? get originImages => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this FolderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderResponseCopyWith<FolderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderResponseCopyWith<$Res> {
  factory $FolderResponseCopyWith(
          FolderResponse value, $Res Function(FolderResponse) then) =
      _$FolderResponseCopyWithImpl<$Res, FolderResponse>;
  @useResult
  $Res call(
      {int folderId,
      String folderName,
      List<String>? originImages,
      bool isDefault});
}

/// @nodoc
class _$FolderResponseCopyWithImpl<$Res, $Val extends FolderResponse>
    implements $FolderResponseCopyWith<$Res> {
  _$FolderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderId = null,
    Object? folderName = null,
    Object? originImages = freezed,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      originImages: freezed == originImages
          ? _value.originImages
          : originImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderResponseImplCopyWith<$Res>
    implements $FolderResponseCopyWith<$Res> {
  factory _$$FolderResponseImplCopyWith(_$FolderResponseImpl value,
          $Res Function(_$FolderResponseImpl) then) =
      __$$FolderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int folderId,
      String folderName,
      List<String>? originImages,
      bool isDefault});
}

/// @nodoc
class __$$FolderResponseImplCopyWithImpl<$Res>
    extends _$FolderResponseCopyWithImpl<$Res, _$FolderResponseImpl>
    implements _$$FolderResponseImplCopyWith<$Res> {
  __$$FolderResponseImplCopyWithImpl(
      _$FolderResponseImpl _value, $Res Function(_$FolderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderId = null,
    Object? folderName = null,
    Object? originImages = freezed,
    Object? isDefault = null,
  }) {
    return _then(_$FolderResponseImpl(
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      originImages: freezed == originImages
          ? _value._originImages
          : originImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderResponseImpl implements _FolderResponse {
  const _$FolderResponseImpl(
      {required this.folderId,
      required this.folderName,
      required final List<String>? originImages,
      required this.isDefault})
      : _originImages = originImages;

  factory _$FolderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderResponseImplFromJson(json);

  @override
  final int folderId;
  @override
  final String folderName;
  final List<String>? _originImages;
  @override
  List<String>? get originImages {
    final value = _originImages;
    if (value == null) return null;
    if (_originImages is EqualUnmodifiableListView) return _originImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isDefault;

  @override
  String toString() {
    return 'FolderResponse(folderId: $folderId, folderName: $folderName, originImages: $originImages, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderResponseImpl &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            const DeepCollectionEquality()
                .equals(other._originImages, _originImages) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, folderId, folderName,
      const DeepCollectionEquality().hash(_originImages), isDefault);

  /// Create a copy of FolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderResponseImplCopyWith<_$FolderResponseImpl> get copyWith =>
      __$$FolderResponseImplCopyWithImpl<_$FolderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderResponseImplToJson(
      this,
    );
  }
}

abstract class _FolderResponse implements FolderResponse {
  const factory _FolderResponse(
      {required final int folderId,
      required final String folderName,
      required final List<String>? originImages,
      required final bool isDefault}) = _$FolderResponseImpl;

  factory _FolderResponse.fromJson(Map<String, dynamic> json) =
      _$FolderResponseImpl.fromJson;

  @override
  int get folderId;
  @override
  String get folderName;
  @override
  List<String>? get originImages;
  @override
  bool get isDefault;

  /// Create a copy of FolderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderResponseImplCopyWith<_$FolderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
