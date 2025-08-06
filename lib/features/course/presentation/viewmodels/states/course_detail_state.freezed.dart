// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  CourseDetailResponse? get courseDetail => throw _privateConstructorUsedError;

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDetailStateCopyWith<CourseDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailStateCopyWith<$Res> {
  factory $CourseDetailStateCopyWith(
          CourseDetailState value, $Res Function(CourseDetailState) then) =
      _$CourseDetailStateCopyWithImpl<$Res, CourseDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      CourseDetailResponse? courseDetail});

  $CourseDetailResponseCopyWith<$Res>? get courseDetail;
}

/// @nodoc
class _$CourseDetailStateCopyWithImpl<$Res, $Val extends CourseDetailState>
    implements $CourseDetailStateCopyWith<$Res> {
  _$CourseDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? courseDetail = freezed,
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
      courseDetail: freezed == courseDetail
          ? _value.courseDetail
          : courseDetail // ignore: cast_nullable_to_non_nullable
              as CourseDetailResponse?,
    ) as $Val);
  }

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseDetailResponseCopyWith<$Res>? get courseDetail {
    if (_value.courseDetail == null) {
      return null;
    }

    return $CourseDetailResponseCopyWith<$Res>(_value.courseDetail!, (value) {
      return _then(_value.copyWith(courseDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseDetailStateImplCopyWith<$Res>
    implements $CourseDetailStateCopyWith<$Res> {
  factory _$$CourseDetailStateImplCopyWith(_$CourseDetailStateImpl value,
          $Res Function(_$CourseDetailStateImpl) then) =
      __$$CourseDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      CourseDetailResponse? courseDetail});

  @override
  $CourseDetailResponseCopyWith<$Res>? get courseDetail;
}

/// @nodoc
class __$$CourseDetailStateImplCopyWithImpl<$Res>
    extends _$CourseDetailStateCopyWithImpl<$Res, _$CourseDetailStateImpl>
    implements _$$CourseDetailStateImplCopyWith<$Res> {
  __$$CourseDetailStateImplCopyWithImpl(_$CourseDetailStateImpl _value,
      $Res Function(_$CourseDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? courseDetail = freezed,
  }) {
    return _then(_$CourseDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      courseDetail: freezed == courseDetail
          ? _value.courseDetail
          : courseDetail // ignore: cast_nullable_to_non_nullable
              as CourseDetailResponse?,
    ));
  }
}

/// @nodoc

class _$CourseDetailStateImpl implements _CourseDetailState {
  const _$CourseDetailStateImpl(
      {this.status = UiStatus.idle, this.errorMessage = '', this.courseDetail});

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final CourseDetailResponse? courseDetail;

  @override
  String toString() {
    return 'CourseDetailState(status: $status, errorMessage: $errorMessage, courseDetail: $courseDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.courseDetail, courseDetail) ||
                other.courseDetail == courseDetail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, courseDetail);

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailStateImplCopyWith<_$CourseDetailStateImpl> get copyWith =>
      __$$CourseDetailStateImplCopyWithImpl<_$CourseDetailStateImpl>(
          this, _$identity);
}

abstract class _CourseDetailState implements CourseDetailState {
  const factory _CourseDetailState(
      {final UiStatus status,
      final String errorMessage,
      final CourseDetailResponse? courseDetail}) = _$CourseDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  CourseDetailResponse? get courseDetail;

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailStateImplCopyWith<_$CourseDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
