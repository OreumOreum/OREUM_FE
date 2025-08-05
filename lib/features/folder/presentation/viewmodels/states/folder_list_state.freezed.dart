// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FolderListState {
  UiStatus get status => throw _privateConstructorUsedError;
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<FolderResponse> get folders => throw _privateConstructorUsedError;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderListStateCopyWith<FolderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderListStateCopyWith<$Res> {
  factory $FolderListStateCopyWith(
          FolderListState value, $Res Function(FolderListState) then) =
      _$FolderListStateCopyWithImpl<$Res, FolderListState>;
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<FolderResponse> folders});
}

/// @nodoc
class _$FolderListStateCopyWithImpl<$Res, $Val extends FolderListState>
    implements $FolderListStateCopyWith<$Res> {
  _$FolderListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? folders = null,
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
      folders: null == folders
          ? _value.folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<FolderResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderListStateImplCopyWith<$Res>
    implements $FolderListStateCopyWith<$Res> {
  factory _$$FolderListStateImplCopyWith(_$FolderListStateImpl value,
          $Res Function(_$FolderListStateImpl) then) =
      __$$FolderListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<FolderResponse> folders});
}

/// @nodoc
class __$$FolderListStateImplCopyWithImpl<$Res>
    extends _$FolderListStateCopyWithImpl<$Res, _$FolderListStateImpl>
    implements _$$FolderListStateImplCopyWith<$Res> {
  __$$FolderListStateImplCopyWithImpl(
      _$FolderListStateImpl _value, $Res Function(_$FolderListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? folders = null,
  }) {
    return _then(_$FolderListStateImpl(
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
      folders: null == folders
          ? _value._folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<FolderResponse>,
    ));
  }
}

/// @nodoc

class _$FolderListStateImpl implements _FolderListState {
  const _$FolderListStateImpl(
      {this.status = UiStatus.idle,
      this.buttonStatus = UiStatus.idle,
      this.errorMessage = '',
      final List<FolderResponse> folders = const []})
      : _folders = folders;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final UiStatus buttonStatus;
  @override
  @JsonKey()
  final String errorMessage;
  final List<FolderResponse> _folders;
  @override
  @JsonKey()
  List<FolderResponse> get folders {
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folders);
  }

  @override
  String toString() {
    return 'FolderListState(status: $status, buttonStatus: $buttonStatus, errorMessage: $errorMessage, folders: $folders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buttonStatus, buttonStatus) ||
                other.buttonStatus == buttonStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._folders, _folders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, buttonStatus,
      errorMessage, const DeepCollectionEquality().hash(_folders));

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderListStateImplCopyWith<_$FolderListStateImpl> get copyWith =>
      __$$FolderListStateImplCopyWithImpl<_$FolderListStateImpl>(
          this, _$identity);
}

abstract class _FolderListState implements FolderListState {
  const factory _FolderListState(
      {final UiStatus status,
      final UiStatus buttonStatus,
      final String errorMessage,
      final List<FolderResponse> folders}) = _$FolderListStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get buttonStatus;
  @override
  String get errorMessage;
  @override
  List<FolderResponse> get folders;

  /// Create a copy of FolderListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderListStateImplCopyWith<_$FolderListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
