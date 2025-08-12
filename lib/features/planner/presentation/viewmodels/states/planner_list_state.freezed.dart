// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerListState {
  UiStatus get status => throw _privateConstructorUsedError;
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<PlannerResponse> get planners => throw _privateConstructorUsedError;

  /// Create a copy of PlannerListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerListStateCopyWith<PlannerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerListStateCopyWith<$Res> {
  factory $PlannerListStateCopyWith(
          PlannerListState value, $Res Function(PlannerListState) then) =
      _$PlannerListStateCopyWithImpl<$Res, PlannerListState>;
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<PlannerResponse> planners});
}

/// @nodoc
class _$PlannerListStateCopyWithImpl<$Res, $Val extends PlannerListState>
    implements $PlannerListStateCopyWith<$Res> {
  _$PlannerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? planners = null,
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
      planners: null == planners
          ? _value.planners
          : planners // ignore: cast_nullable_to_non_nullable
              as List<PlannerResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerListStateImplCopyWith<$Res>
    implements $PlannerListStateCopyWith<$Res> {
  factory _$$PlannerListStateImplCopyWith(_$PlannerListStateImpl value,
          $Res Function(_$PlannerListStateImpl) then) =
      __$$PlannerListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus buttonStatus,
      String errorMessage,
      List<PlannerResponse> planners});
}

/// @nodoc
class __$$PlannerListStateImplCopyWithImpl<$Res>
    extends _$PlannerListStateCopyWithImpl<$Res, _$PlannerListStateImpl>
    implements _$$PlannerListStateImplCopyWith<$Res> {
  __$$PlannerListStateImplCopyWithImpl(_$PlannerListStateImpl _value,
      $Res Function(_$PlannerListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? buttonStatus = null,
    Object? errorMessage = null,
    Object? planners = null,
  }) {
    return _then(_$PlannerListStateImpl(
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
      planners: null == planners
          ? _value._planners
          : planners // ignore: cast_nullable_to_non_nullable
              as List<PlannerResponse>,
    ));
  }
}

/// @nodoc

class _$PlannerListStateImpl implements _PlannerListState {
  const _$PlannerListStateImpl(
      {this.status = UiStatus.idle,
      this.buttonStatus = UiStatus.idle,
      this.errorMessage = '',
      final List<PlannerResponse> planners = const []})
      : _planners = planners;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final UiStatus buttonStatus;
  @override
  @JsonKey()
  final String errorMessage;
  final List<PlannerResponse> _planners;
  @override
  @JsonKey()
  List<PlannerResponse> get planners {
    if (_planners is EqualUnmodifiableListView) return _planners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planners);
  }

  @override
  String toString() {
    return 'PlannerListState(status: $status, buttonStatus: $buttonStatus, errorMessage: $errorMessage, planners: $planners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerListStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.buttonStatus, buttonStatus) ||
                other.buttonStatus == buttonStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._planners, _planners));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, buttonStatus,
      errorMessage, const DeepCollectionEquality().hash(_planners));

  /// Create a copy of PlannerListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerListStateImplCopyWith<_$PlannerListStateImpl> get copyWith =>
      __$$PlannerListStateImplCopyWithImpl<_$PlannerListStateImpl>(
          this, _$identity);
}

abstract class _PlannerListState implements PlannerListState {
  const factory _PlannerListState(
      {final UiStatus status,
      final UiStatus buttonStatus,
      final String errorMessage,
      final List<PlannerResponse> planners}) = _$PlannerListStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get buttonStatus;
  @override
  String get errorMessage;
  @override
  List<PlannerResponse> get planners;

  /// Create a copy of PlannerListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerListStateImplCopyWith<_$PlannerListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
