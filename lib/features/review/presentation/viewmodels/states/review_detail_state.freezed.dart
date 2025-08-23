// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewDetailState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<ReviewResponse> get reviews => throw _privateConstructorUsedError;
  UiStatus get buttonStatus => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  bool get isLoadingNextPage => throw _privateConstructorUsedError;

  /// Create a copy of ReviewDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewDetailStateCopyWith<ReviewDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailStateCopyWith<$Res> {
  factory $ReviewDetailStateCopyWith(
          ReviewDetailState value, $Res Function(ReviewDetailState) then) =
      _$ReviewDetailStateCopyWithImpl<$Res, ReviewDetailState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<ReviewResponse> reviews,
      UiStatus buttonStatus,
      int currentPage,
      bool isLastPage,
      bool isLoadingNextPage});
}

/// @nodoc
class _$ReviewDetailStateCopyWithImpl<$Res, $Val extends ReviewDetailState>
    implements $ReviewDetailStateCopyWith<$Res> {
  _$ReviewDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? reviews = null,
    Object? buttonStatus = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? isLoadingNextPage = null,
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
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewDetailStateImplCopyWith<$Res>
    implements $ReviewDetailStateCopyWith<$Res> {
  factory _$$ReviewDetailStateImplCopyWith(_$ReviewDetailStateImpl value,
          $Res Function(_$ReviewDetailStateImpl) then) =
      __$$ReviewDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<ReviewResponse> reviews,
      UiStatus buttonStatus,
      int currentPage,
      bool isLastPage,
      bool isLoadingNextPage});
}

/// @nodoc
class __$$ReviewDetailStateImplCopyWithImpl<$Res>
    extends _$ReviewDetailStateCopyWithImpl<$Res, _$ReviewDetailStateImpl>
    implements _$$ReviewDetailStateImplCopyWith<$Res> {
  __$$ReviewDetailStateImplCopyWithImpl(_$ReviewDetailStateImpl _value,
      $Res Function(_$ReviewDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? reviews = null,
    Object? buttonStatus = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? isLoadingNextPage = null,
  }) {
    return _then(_$ReviewDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      buttonStatus: null == buttonStatus
          ? _value.buttonStatus
          : buttonStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReviewDetailStateImpl implements _ReviewDetailState {
  const _$ReviewDetailStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<ReviewResponse> reviews = const [],
      this.buttonStatus = UiStatus.idle,
      this.currentPage = 0,
      this.isLastPage = false,
      this.isLoadingNextPage = false})
      : _reviews = reviews;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<ReviewResponse> _reviews;
  @override
  @JsonKey()
  List<ReviewResponse> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final UiStatus buttonStatus;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLastPage;
  @override
  @JsonKey()
  final bool isLoadingNextPage;

  @override
  String toString() {
    return 'ReviewDetailState(status: $status, errorMessage: $errorMessage, reviews: $reviews, buttonStatus: $buttonStatus, currentPage: $currentPage, isLastPage: $isLastPage, isLoadingNextPage: $isLoadingNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.buttonStatus, buttonStatus) ||
                other.buttonStatus == buttonStatus) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.isLoadingNextPage, isLoadingNextPage) ||
                other.isLoadingNextPage == isLoadingNextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_reviews),
      buttonStatus,
      currentPage,
      isLastPage,
      isLoadingNextPage);

  /// Create a copy of ReviewDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDetailStateImplCopyWith<_$ReviewDetailStateImpl> get copyWith =>
      __$$ReviewDetailStateImplCopyWithImpl<_$ReviewDetailStateImpl>(
          this, _$identity);
}

abstract class _ReviewDetailState implements ReviewDetailState {
  const factory _ReviewDetailState(
      {final UiStatus status,
      final String errorMessage,
      final List<ReviewResponse> reviews,
      final UiStatus buttonStatus,
      final int currentPage,
      final bool isLastPage,
      final bool isLoadingNextPage}) = _$ReviewDetailStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<ReviewResponse> get reviews;
  @override
  UiStatus get buttonStatus;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  @override
  bool get isLoadingNextPage;

  /// Create a copy of ReviewDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewDetailStateImplCopyWith<_$ReviewDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
