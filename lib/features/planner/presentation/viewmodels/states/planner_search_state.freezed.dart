// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlannerSearchState {
  UiStatus get status => throw _privateConstructorUsedError;
  UiStatus get paginationStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  SearchPlaceResponse? get searchPlace => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlannerSearchStateCopyWith<PlannerSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerSearchStateCopyWith<$Res> {
  factory $PlannerSearchStateCopyWith(
          PlannerSearchState value, $Res Function(PlannerSearchState) then) =
      _$PlannerSearchStateCopyWithImpl<$Res, PlannerSearchState>;
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus paginationStatus,
      String errorMessage,
      SearchPlaceResponse? searchPlace,
      bool isSearching,
      int currentPage,
      bool isLastPage,
      String keyword});

  $SearchPlaceResponseCopyWith<$Res>? get searchPlace;
}

/// @nodoc
class _$PlannerSearchStateCopyWithImpl<$Res, $Val extends PlannerSearchState>
    implements $PlannerSearchStateCopyWith<$Res> {
  _$PlannerSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? errorMessage = null,
    Object? searchPlace = freezed,
    Object? isSearching = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      searchPlace: freezed == searchPlace
          ? _value.searchPlace
          : searchPlace // ignore: cast_nullable_to_non_nullable
              as SearchPlaceResponse?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPlaceResponseCopyWith<$Res>? get searchPlace {
    if (_value.searchPlace == null) {
      return null;
    }

    return $SearchPlaceResponseCopyWith<$Res>(_value.searchPlace!, (value) {
      return _then(_value.copyWith(searchPlace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlannerSearchStateImplCopyWith<$Res>
    implements $PlannerSearchStateCopyWith<$Res> {
  factory _$$PlannerSearchStateImplCopyWith(_$PlannerSearchStateImpl value,
          $Res Function(_$PlannerSearchStateImpl) then) =
      __$$PlannerSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      UiStatus paginationStatus,
      String errorMessage,
      SearchPlaceResponse? searchPlace,
      bool isSearching,
      int currentPage,
      bool isLastPage,
      String keyword});

  @override
  $SearchPlaceResponseCopyWith<$Res>? get searchPlace;
}

/// @nodoc
class __$$PlannerSearchStateImplCopyWithImpl<$Res>
    extends _$PlannerSearchStateCopyWithImpl<$Res, _$PlannerSearchStateImpl>
    implements _$$PlannerSearchStateImplCopyWith<$Res> {
  __$$PlannerSearchStateImplCopyWithImpl(_$PlannerSearchStateImpl _value,
      $Res Function(_$PlannerSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? paginationStatus = null,
    Object? errorMessage = null,
    Object? searchPlace = freezed,
    Object? isSearching = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? keyword = null,
  }) {
    return _then(_$PlannerSearchStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      paginationStatus: null == paginationStatus
          ? _value.paginationStatus
          : paginationStatus // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      searchPlace: freezed == searchPlace
          ? _value.searchPlace
          : searchPlace // ignore: cast_nullable_to_non_nullable
              as SearchPlaceResponse?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlannerSearchStateImpl implements _PlannerSearchState {
  const _$PlannerSearchStateImpl(
      {this.status = UiStatus.idle,
      this.paginationStatus = UiStatus.idle,
      this.errorMessage = '',
      this.searchPlace,
      this.isSearching = false,
      this.currentPage = 0,
      this.isLastPage = false,
      this.keyword = ''});

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final UiStatus paginationStatus;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final SearchPlaceResponse? searchPlace;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLastPage;
  @override
  @JsonKey()
  final String keyword;

  @override
  String toString() {
    return 'PlannerSearchState(status: $status, paginationStatus: $paginationStatus, errorMessage: $errorMessage, searchPlace: $searchPlace, isSearching: $isSearching, currentPage: $currentPage, isLastPage: $isLastPage, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlannerSearchStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationStatus, paginationStatus) ||
                other.paginationStatus == paginationStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchPlace, searchPlace) ||
                other.searchPlace == searchPlace) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, paginationStatus,
      errorMessage, searchPlace, isSearching, currentPage, isLastPage, keyword);

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlannerSearchStateImplCopyWith<_$PlannerSearchStateImpl> get copyWith =>
      __$$PlannerSearchStateImplCopyWithImpl<_$PlannerSearchStateImpl>(
          this, _$identity);
}

abstract class _PlannerSearchState implements PlannerSearchState {
  const factory _PlannerSearchState(
      {final UiStatus status,
      final UiStatus paginationStatus,
      final String errorMessage,
      final SearchPlaceResponse? searchPlace,
      final bool isSearching,
      final int currentPage,
      final bool isLastPage,
      final String keyword}) = _$PlannerSearchStateImpl;

  @override
  UiStatus get status;
  @override
  UiStatus get paginationStatus;
  @override
  String get errorMessage;
  @override
  SearchPlaceResponse? get searchPlace;
  @override
  bool get isSearching;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  @override
  String get keyword;

  /// Create a copy of PlannerSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlannerSearchStateImplCopyWith<_$PlannerSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
