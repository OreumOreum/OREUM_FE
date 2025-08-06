// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<PlannerDetailResponse> get plannerPlaces =>
      throw _privateConstructorUsedError;

  /// Create a copy of PlannerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerDetailStateCopyWith<PlannerDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerDetailStateCopyWith<$Res> {
  factory $PlannerDetailStateCopyWith(
          PlannerDetailState value, $Res Function(PlannerDetailState) then) =
      _$PlannerDetailStateCopyWithImpl<$Res, PlannerDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<PlannerDetailResponse> plannerPlaces});
}

/// @nodoc
class _$PlannerDetailStateCopyWithImpl<$Res, $Val extends PlannerDetailState>
    implements $PlannerDetailStateCopyWith<$Res> {
  _$PlannerDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? plannerPlaces = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      plannerPlaces: null == plannerPlaces
          ? _value.plannerPlaces
          : plannerPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlannerDetailResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerDetailStateImplCopyWith<$Res>
    implements $PlannerDetailStateCopyWith<$Res> {
  factory _$$PlannerDetailStateImplCopyWith(_$PlannerDetailStateImpl value,
          $Res Function(_$PlannerDetailStateImpl) then) =
      __$$PlannerDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<PlannerDetailResponse> plannerPlaces});
}

/// @nodoc
class __$$PlannerDetailStateImplCopyWithImpl<$Res>
    extends _$PlannerDetailStateCopyWithImpl<$Res, _$PlannerDetailStateImpl>
    implements _$$PlannerDetailStateImplCopyWith<$Res> {
  __$$PlannerDetailStateImplCopyWithImpl(_$PlannerDetailStateImpl _value,
      $Res Function(_$PlannerDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? plannerPlaces = null,
  }) {
    return _then(_$PlannerDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      plannerPlaces: null == plannerPlaces
          ? _value._plannerPlaces
          : plannerPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlannerDetailResponse>,
    ));
  }
}

/// @nodoc

class _$PlannerDetailStateImpl implements _PlannerDetailState {
  const _$PlannerDetailStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<PlannerDetailResponse> plannerPlaces = const []})
      : _plannerPlaces = plannerPlaces;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<PlannerDetailResponse> _plannerPlaces;
  @override
  @JsonKey()
  List<PlannerDetailResponse> get plannerPlaces {
    if (_plannerPlaces is EqualUnmodifiableListView) return _plannerPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plannerPlaces);
  }

  @override
  String toString() {
    return 'PlannerDetailState(status: $status, errorMessage: $errorMessage, plannerPlaces: $plannerPlaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._plannerPlaces, _plannerPlaces));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_plannerPlaces));

  /// Create a copy of PlannerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerDetailStateImplCopyWith<_$PlannerDetailStateImpl> get copyWith =>
      __$$PlannerDetailStateImplCopyWithImpl<_$PlannerDetailStateImpl>(
          this, _$identity);
}

abstract class _PlannerDetailState implements PlannerDetailState {
  const factory _PlannerDetailState(
          {final UiStatus status,
          final String errorMessage,
          final List<PlannerDetailResponse> plannerPlaces}) =
      _$PlannerDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<PlannerDetailResponse> get plannerPlaces;

  /// Create a copy of PlannerDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerDetailStateImplCopyWith<_$PlannerDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
