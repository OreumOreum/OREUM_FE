// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FolderDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  dynamic get folderPlaces => throw _privateConstructorUsedError;
  String? get folderName => throw _privateConstructorUsedError;

  /// Create a copy of FolderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderDetailStateCopyWith<FolderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderDetailStateCopyWith<$Res> {
  factory $FolderDetailStateCopyWith(
          FolderDetailState value, $Res Function(FolderDetailState) then) =
      _$FolderDetailStateCopyWithImpl<$Res, FolderDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      dynamic folderPlaces,
      String? folderName});
}

/// @nodoc
class _$FolderDetailStateCopyWithImpl<$Res, $Val extends FolderDetailState>
    implements $FolderDetailStateCopyWith<$Res> {
  _$FolderDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? folderPlaces = freezed,
    Object? folderName = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      folderPlaces: freezed == folderPlaces
          ? _value.folderPlaces
          : folderPlaces // ignore: cast_nullable_to_non_nullable
              as dynamic,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderDetailStateImplCopyWith<$Res>
    implements $FolderDetailStateCopyWith<$Res> {
  factory _$$FolderDetailStateImplCopyWith(_$FolderDetailStateImpl value,
          $Res Function(_$FolderDetailStateImpl) then) =
      __$$FolderDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      dynamic folderPlaces,
      String? folderName});
}

/// @nodoc
class __$$FolderDetailStateImplCopyWithImpl<$Res>
    extends _$FolderDetailStateCopyWithImpl<$Res, _$FolderDetailStateImpl>
    implements _$$FolderDetailStateImplCopyWith<$Res> {
  __$$FolderDetailStateImplCopyWithImpl(_$FolderDetailStateImpl _value,
      $Res Function(_$FolderDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? folderPlaces = freezed,
    Object? folderName = freezed,
  }) {
    return _then(_$FolderDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      folderPlaces:
          freezed == folderPlaces ? _value.folderPlaces! : folderPlaces,
      folderName: freezed == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FolderDetailStateImpl implements _FolderDetailState {
  const _$FolderDetailStateImpl(
      {this.status = UiStatus.idle,
      this.buttonStatus = UiStatus.idle,
      this.errorMessage = '',
      this.folderPlaces = List<FolderDetailResponse>,
      this.folderName});

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final UiStatus buttonStatus;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final dynamic folderPlaces;
  @override
  final String? folderName;

  @override
  String toString() {
    return 'FolderDetailState(status: $status, buttonStatus: $buttonStatus, errorMessage: $errorMessage, folderPlaces: $folderPlaces, folderName: $folderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buttonStatus, buttonStatus) ||
                other.buttonStatus == buttonStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.folderPlaces, folderPlaces) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      buttonStatus,
      errorMessage,
      const DeepCollectionEquality().hash(folderPlaces),
      folderName);

  /// Create a copy of FolderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderDetailStateImplCopyWith<_$FolderDetailStateImpl> get copyWith =>
      __$$FolderDetailStateImplCopyWithImpl<_$FolderDetailStateImpl>(
          this, _$identity);
}

abstract class _FolderDetailState implements FolderDetailState {
  const factory _FolderDetailState(
      {final UiStatus status,
      final UiStatus buttonStatus,
      final String errorMessage,
      final dynamic folderPlaces,
      final String? folderName}) = _$FolderDetailStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get buttonStatus;
  @override
  String get errorMessage;
  @override
  dynamic get folderPlaces;
  @override
  String? get folderName;

  /// Create a copy of FolderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderDetailStateImplCopyWith<_$FolderDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
