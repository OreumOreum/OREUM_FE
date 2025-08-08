// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_name_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlannerNameRequest _$PlannerNameRequestFromJson(Map<String, dynamic> json) {
  return _PlannerNameRequest.fromJson(json);
}

/// @nodoc
mixin _$PlannerNameRequest {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PlannerNameRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlannerNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerNameRequestCopyWith<PlannerNameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerNameRequestCopyWith<$Res> {
  factory $PlannerNameRequestCopyWith(
          PlannerNameRequest value, $Res Function(PlannerNameRequest) then) =
      _$PlannerNameRequestCopyWithImpl<$Res, PlannerNameRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PlannerNameRequestCopyWithImpl<$Res, $Val extends PlannerNameRequest>
    implements $PlannerNameRequestCopyWith<$Res> {
  _$PlannerNameRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlannerNameRequestImplCopyWith<$Res>
    implements $PlannerNameRequestCopyWith<$Res> {
  factory _$$PlannerNameRequestImplCopyWith(_$PlannerNameRequestImpl value,
          $Res Function(_$PlannerNameRequestImpl) then) =
      __$$PlannerNameRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PlannerNameRequestImplCopyWithImpl<$Res>
    extends _$PlannerNameRequestCopyWithImpl<$Res, _$PlannerNameRequestImpl>
    implements _$$PlannerNameRequestImplCopyWith<$Res> {
  __$$PlannerNameRequestImplCopyWithImpl(_$PlannerNameRequestImpl _value,
      $Res Function(_$PlannerNameRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PlannerNameRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlannerNameRequestImpl implements _PlannerNameRequest {
  const _$PlannerNameRequestImpl({required this.name});

  factory _$PlannerNameRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlannerNameRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'PlannerNameRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerNameRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PlannerNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerNameRequestImplCopyWith<_$PlannerNameRequestImpl> get copyWith =>
      __$$PlannerNameRequestImplCopyWithImpl<_$PlannerNameRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlannerNameRequestImplToJson(
      this,
    );
  }
}

abstract class _PlannerNameRequest implements PlannerNameRequest {
  const factory _PlannerNameRequest({required final String name}) =
      _$PlannerNameRequestImpl;

  factory _PlannerNameRequest.fromJson(Map<String, dynamic> json) =
      _$PlannerNameRequestImpl.fromJson;

  @override
  String get name;

  /// Create a copy of PlannerNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerNameRequestImplCopyWith<_$PlannerNameRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
