// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_detail_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaceDetailAddState {
  UiStatus get status => throw _privateConstructorUsedError;
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<FolderSavedResponse> get folders => throw _privateConstructorUsedError;

  /// Create a copy of PlaceDetailAddState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceDetailAddStateCopyWith<PlaceDetailAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailAddStateCopyWith<$Res> {
  factory $PlaceDetailAddStateCopyWith(
          PlaceDetailAddState value, $Res Function(PlaceDetailAddState) then) =
      _$PlaceDetailAddStateCopyWithImpl<$Res, PlaceDetailAddState>;
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<FolderSavedResponse> folders});
}

/// @nodoc
class _$PlaceDetailAddStateCopyWithImpl<$Res, $Val extends PlaceDetailAddState>
    implements $PlaceDetailAddStateCopyWith<$Res> {
  _$PlaceDetailAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceDetailAddState
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
              as List<FolderSavedResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceDetailAddStateImplCopyWith<$Res>
    implements $PlaceDetailAddStateCopyWith<$Res> {
  factory _$$PlaceDetailAddStateImplCopyWith(_$PlaceDetailAddStateImpl value,
          $Res Function(_$PlaceDetailAddStateImpl) then) =
      __$$PlaceDetailAddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<FolderSavedResponse> folders});
}

/// @nodoc
class __$$PlaceDetailAddStateImplCopyWithImpl<$Res>
    extends _$PlaceDetailAddStateCopyWithImpl<$Res, _$PlaceDetailAddStateImpl>
    implements _$$PlaceDetailAddStateImplCopyWith<$Res> {
  __$$PlaceDetailAddStateImplCopyWithImpl(_$PlaceDetailAddStateImpl _value,
      $Res Function(_$PlaceDetailAddStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceDetailAddState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? folders = null,
  }) {
    return _then(_$PlaceDetailAddStateImpl(
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
              as List<FolderSavedResponse>,
    ));
  }
}

/// @nodoc

class _$PlaceDetailAddStateImpl implements _PlaceDetailAddState {
  const _$PlaceDetailAddStateImpl(
      {this.status = UiStatus.idle,
      this.buttonStatus = UiStatus.idle,
      this.errorMessage = '',
      final List<FolderSavedResponse> folders = const []})
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
  final List<FolderSavedResponse> _folders;
  @override
  @JsonKey()
  List<FolderSavedResponse> get folders {
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folders);
  }

  @override
  String toString() {
    return 'PlaceDetailAddState(status: $status, buttonStatus: $buttonStatus, errorMessage: $errorMessage, folders: $folders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailAddStateImpl &&
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

  /// Create a copy of PlaceDetailAddState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailAddStateImplCopyWith<_$PlaceDetailAddStateImpl> get copyWith =>
      __$$PlaceDetailAddStateImplCopyWithImpl<_$PlaceDetailAddStateImpl>(
          this, _$identity);
}

abstract class _PlaceDetailAddState implements PlaceDetailAddState {
  const factory _PlaceDetailAddState(
      {final UiStatus status,
      final UiStatus buttonStatus,
      final String errorMessage,
      final List<FolderSavedResponse> folders}) = _$PlaceDetailAddStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get buttonStatus;
  @override
  String get errorMessage;
  @override
  List<FolderSavedResponse> get folders;

  /// Create a copy of PlaceDetailAddState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceDetailAddStateImplCopyWith<_$PlaceDetailAddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
