// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_detail_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FolderDetailArg {
  String get folderName => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Create a copy of FolderDetailArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderDetailArgCopyWith<FolderDetailArg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderDetailArgCopyWith<$Res> {
  factory $FolderDetailArgCopyWith(
          FolderDetailArg value, $Res Function(FolderDetailArg) then) =
      _$FolderDetailArgCopyWithImpl<$Res, FolderDetailArg>;
  @useResult
  $Res call({String folderName, bool isDefault});
}

/// @nodoc
class _$FolderDetailArgCopyWithImpl<$Res, $Val extends FolderDetailArg>
    implements $FolderDetailArgCopyWith<$Res> {
  _$FolderDetailArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderDetailArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderName = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderDetailArgImplCopyWith<$Res>
    implements $FolderDetailArgCopyWith<$Res> {
  factory _$$FolderDetailArgImplCopyWith(_$FolderDetailArgImpl value,
          $Res Function(_$FolderDetailArgImpl) then) =
      __$$FolderDetailArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String folderName, bool isDefault});
}

/// @nodoc
class __$$FolderDetailArgImplCopyWithImpl<$Res>
    extends _$FolderDetailArgCopyWithImpl<$Res, _$FolderDetailArgImpl>
    implements _$$FolderDetailArgImplCopyWith<$Res> {
  __$$FolderDetailArgImplCopyWithImpl(
      _$FolderDetailArgImpl _value, $Res Function(_$FolderDetailArgImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderDetailArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderName = null,
    Object? isDefault = null,
  }) {
    return _then(_$FolderDetailArgImpl(
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FolderDetailArgImpl implements _FolderDetailArg {
  const _$FolderDetailArgImpl(
      {required this.folderName, required this.isDefault});

  @override
  final String folderName;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'FolderDetailArg(folderName: $folderName, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderDetailArgImpl &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, folderName, isDefault);

  /// Create a copy of FolderDetailArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderDetailArgImplCopyWith<_$FolderDetailArgImpl> get copyWith =>
      __$$FolderDetailArgImplCopyWithImpl<_$FolderDetailArgImpl>(
          this, _$identity);
}

abstract class _FolderDetailArg implements FolderDetailArg {
  const factory _FolderDetailArg(
      {required final String folderName,
      required final bool isDefault}) = _$FolderDetailArgImpl;

  @override
  String get folderName;
  @override
  bool get isDefault;

  /// Create a copy of FolderDetailArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderDetailArgImplCopyWith<_$FolderDetailArgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
