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
  List<ReviewResponse> get reviews => throw _privateConstructorUsedError;
  TourResponse? get tour => throw _privateConstructorUsedError;
  List<CourseResponse> get courses => throw _privateConstructorUsedError;

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
      CourseDetailResponse? courseDetail,
      List<ReviewResponse> reviews,
      TourResponse? tour,
      List<CourseResponse> courses});

  $CourseDetailResponseCopyWith<$Res>? get courseDetail;
  $TourResponseCopyWith<$Res>? get tour;
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
    Object? reviews = null,
    Object? tour = freezed,
    Object? courses = null,
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
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      tour: freezed == tour
          ? _value.tour
          : tour // ignore: cast_nullable_to_non_nullable
              as TourResponse?,
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseResponse>,
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

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TourResponseCopyWith<$Res>? get tour {
    if (_value.tour == null) {
      return null;
    }

    return $TourResponseCopyWith<$Res>(_value.tour!, (value) {
      return _then(_value.copyWith(tour: value) as $Val);
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
      CourseDetailResponse? courseDetail,
      List<ReviewResponse> reviews,
      TourResponse? tour,
      List<CourseResponse> courses});

  @override
  $CourseDetailResponseCopyWith<$Res>? get courseDetail;
  @override
  $TourResponseCopyWith<$Res>? get tour;
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
    Object? reviews = null,
    Object? tour = freezed,
    Object? courses = null,
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
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      tour: freezed == tour
          ? _value.tour
          : tour // ignore: cast_nullable_to_non_nullable
              as TourResponse?,
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseResponse>,
    ));
  }
}

/// @nodoc

class _$CourseDetailStateImpl implements _CourseDetailState {
  const _$CourseDetailStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      this.courseDetail,
      final List<ReviewResponse> reviews = const [],
      this.tour,
      final List<CourseResponse> courses = const []})
      : _reviews = reviews,
        _courses = courses;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final CourseDetailResponse? courseDetail;
  final List<ReviewResponse> _reviews;
  @override
  @JsonKey()
  List<ReviewResponse> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final TourResponse? tour;
  final List<CourseResponse> _courses;
  @override
  @JsonKey()
  List<CourseResponse> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  String toString() {
    return 'CourseDetailState(status: $status, errorMessage: $errorMessage, courseDetail: $courseDetail, reviews: $reviews, tour: $tour, courses: $courses)';
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
                other.courseDetail == courseDetail) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.tour, tour) || other.tour == tour) &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      courseDetail,
      const DeepCollectionEquality().hash(_reviews),
      tour,
      const DeepCollectionEquality().hash(_courses));

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
      final CourseDetailResponse? courseDetail,
      final List<ReviewResponse> reviews,
      final TourResponse? tour,
      final List<CourseResponse> courses}) = _$CourseDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  CourseDetailResponse? get courseDetail;
  @override
  List<ReviewResponse> get reviews;
  @override
  TourResponse? get tour;
  @override
  List<CourseResponse> get courses;

  /// Create a copy of CourseDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDetailStateImplCopyWith<_$CourseDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
