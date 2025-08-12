// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlannerResponse _$PlannerResponseFromJson(Map<String, dynamic> json) {
  return _PlannerResponse.fromJson(json);
}

/// @nodoc
mixin _$PlannerResponse {
  int get plannerId => throw _privateConstructorUsedError;
  String get plannerName => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;

  /// Serializes this PlannerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerResponseCopyWith<PlannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerResponseCopyWith<$Res> {
  factory $PlannerResponseCopyWith(
          PlannerResponse value, $Res Function(PlannerResponse) then) =
      _$PlannerResponseCopyWithImpl<$Res, PlannerResponse>;
  @useResult
  $Res call({int plannerId, String plannerName, int day});
}

/// @nodoc
class _$PlannerResponseCopyWithImpl<$Res, $Val extends PlannerResponse>
    implements $PlannerResponseCopyWith<$Res> {
  _$PlannerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerId = null,
    Object? plannerName = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      plannerId: null == plannerId
          ? _value.plannerId
          : plannerId // ignore: cast_nullable_to_non_nullable
              as int,
      plannerName: null == plannerName
          ? _value.plannerName
          : plannerName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerResponseImplCopyWith<$Res>
    implements $PlannerResponseCopyWith<$Res> {
  factory _$$PlannerResponseImplCopyWith(_$PlannerResponseImpl value,
          $Res Function(_$PlannerResponseImpl) then) =
      __$$PlannerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int plannerId, String plannerName, int day});
}

/// @nodoc
class __$$PlannerResponseImplCopyWithImpl<$Res>
    extends _$PlannerResponseCopyWithImpl<$Res, _$PlannerResponseImpl>
    implements _$$PlannerResponseImplCopyWith<$Res> {
  __$$PlannerResponseImplCopyWithImpl(
      _$PlannerResponseImpl _value, $Res Function(_$PlannerResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plannerId = null,
    Object? plannerName = null,
    Object? day = null,
  }) {
    return _then(_$PlannerResponseImpl(
      plannerId: null == plannerId
          ? _value.plannerId
          : plannerId // ignore: cast_nullable_to_non_nullable
              as int,
      plannerName: null == plannerName
          ? _value.plannerName
          : plannerName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannerResponseImpl implements _PlannerResponse {
  const _$PlannerResponseImpl(
      {required this.plannerId, required this.plannerName, required this.day});

  factory _$PlannerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannerResponseImplFromJson(json);

  @override
  final int plannerId;
  @override
  final String plannerName;
  @override
  final int day;

  @override
  String toString() {
    return 'PlannerResponse(plannerId: $plannerId, plannerName: $plannerName, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerResponseImpl &&
            (identical(other.plannerId, plannerId) ||
                other.plannerId == plannerId) &&
            (identical(other.plannerName, plannerName) ||
                other.plannerName == plannerName) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plannerId, plannerName, day);

  /// Create a copy of PlannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerResponseImplCopyWith<_$PlannerResponseImpl> get copyWith =>
      __$$PlannerResponseImplCopyWithImpl<_$PlannerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannerResponseImplToJson(
      this,
    );
  }
}

abstract class _PlannerResponse implements PlannerResponse {
  const factory _PlannerResponse(
      {required final int plannerId,
      required final String plannerName,
      required final int day}) = _$PlannerResponseImpl;

  factory _PlannerResponse.fromJson(Map<String, dynamic> json) =
      _$PlannerResponseImpl.fromJson;

  @override
  int get plannerId;
  @override
  String get plannerName;
  @override
  int get day;

  /// Create a copy of PlannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerResponseImplCopyWith<_$PlannerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
