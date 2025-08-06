// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerEditState {
  List<PlannerEditPlace> get plannerPlaces =>
      throw _privateConstructorUsedError;
  List<int> get tabDays => throw _privateConstructorUsedError;
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of PlannerEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerEditStateCopyWith<PlannerEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerEditStateCopyWith<$Res> {
  factory $PlannerEditStateCopyWith(
          PlannerEditState value, $Res Function(PlannerEditState) then) =
      _$PlannerEditStateCopyWithImpl<$Res, PlannerEditState>;
  @useResult
  $Res call(
      {List<PlannerEditPlace> plannerPlaces,
      List<int> tabDays,
      UiStatus status,
      String errorMessage});
}

/// @nodoc
class _$PlannerEditStateCopyWithImpl<$Res, $Val extends PlannerEditState>
    implements $PlannerEditStateCopyWith<$Res> {
  _$PlannerEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerPlaces = null,
    Object? tabDays = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      plannerPlaces: null == plannerPlaces
          ? _value.plannerPlaces
          : plannerPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlannerEditPlace>,
      tabDays: null == tabDays
          ? _value.tabDays
          : tabDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerEditStateImplCopyWith<$Res>
    implements $PlannerEditStateCopyWith<$Res> {
  factory _$$PlannerEditStateImplCopyWith(_$PlannerEditStateImpl value,
          $Res Function(_$PlannerEditStateImpl) then) =
      __$$PlannerEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PlannerEditPlace> plannerPlaces,
      List<int> tabDays,
      UiStatus status,
      String errorMessage});
}

/// @nodoc
class __$$PlannerEditStateImplCopyWithImpl<$Res>
    extends _$PlannerEditStateCopyWithImpl<$Res, _$PlannerEditStateImpl>
    implements _$$PlannerEditStateImplCopyWith<$Res> {
  __$$PlannerEditStateImplCopyWithImpl(_$PlannerEditStateImpl _value,
      $Res Function(_$PlannerEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerPlaces = null,
    Object? tabDays = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$PlannerEditStateImpl(
      plannerPlaces: null == plannerPlaces
          ? _value._plannerPlaces
          : plannerPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlannerEditPlace>,
      tabDays: null == tabDays
          ? _value._tabDays
          : tabDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlannerEditStateImpl implements _PlannerEditState {
  const _$PlannerEditStateImpl(
      {final List<PlannerEditPlace> plannerPlaces = const [],
      final List<int> tabDays = const [1],
      this.status = UiStatus.idle,
      this.errorMessage = ''})
      : _plannerPlaces = plannerPlaces,
        _tabDays = tabDays;

  final List<PlannerEditPlace> _plannerPlaces;
  @override
  @JsonKey()
  List<PlannerEditPlace> get plannerPlaces {
    if (_plannerPlaces is EqualUnmodifiableListView) return _plannerPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plannerPlaces);
  }

  final List<int> _tabDays;
  @override
  @JsonKey()
  List<int> get tabDays {
    if (_tabDays is EqualUnmodifiableListView) return _tabDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabDays);
  }

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'PlannerEditState(plannerPlaces: $plannerPlaces, tabDays: $tabDays, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerEditStateImpl &&
            const DeepCollectionEquality()
                .equals(other._plannerPlaces, _plannerPlaces) &&
            const DeepCollectionEquality().equals(other._tabDays, _tabDays) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_plannerPlaces),
      const DeepCollectionEquality().hash(_tabDays),
      status,
      errorMessage);

  /// Create a copy of PlannerEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerEditStateImplCopyWith<_$PlannerEditStateImpl> get copyWith =>
      __$$PlannerEditStateImplCopyWithImpl<_$PlannerEditStateImpl>(
          this, _$identity);
}

abstract class _PlannerEditState implements PlannerEditState {
  const factory _PlannerEditState(
      {final List<PlannerEditPlace> plannerPlaces,
      final List<int> tabDays,
      final UiStatus status,
      final String errorMessage}) = _$PlannerEditStateImpl;

  @override
  List<PlannerEditPlace> get plannerPlaces;
  @override
  List<int> get tabDays;
  @override
  UiStatus get status;
  @override
  String get errorMessage;

  /// Create a copy of PlannerEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerEditStateImplCopyWith<_$PlannerEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
