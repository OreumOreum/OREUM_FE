// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecommendState {
  UiStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<Place> get originalPlaces => throw _privateConstructorUsedError;
  List<Place> get filteredPlaces => throw _privateConstructorUsedError;
  RegionFilter get selectedFilter => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  bool get isLoadingNextPage => throw _privateConstructorUsedError;
  int? get selectedContentTypeId => throw _privateConstructorUsedError;
  TravelType? get myTravelType => throw _privateConstructorUsedError;

  /// Create a copy of RecommendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendStateCopyWith<RecommendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendStateCopyWith<$Res> {
  factory $RecommendStateCopyWith(
          RecommendState value, $Res Function(RecommendState) then) =
      _$RecommendStateCopyWithImpl<$Res, RecommendState>;
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<Place> originalPlaces,
      List<Place> filteredPlaces,
      RegionFilter selectedFilter,
      int currentPage,
      bool isLastPage,
      bool isLoadingNextPage,
      int? selectedContentTypeId,
      TravelType? myTravelType});
}

/// @nodoc
class _$RecommendStateCopyWithImpl<$Res, $Val extends RecommendState>
    implements $RecommendStateCopyWith<$Res> {
  _$RecommendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? originalPlaces = null,
    Object? filteredPlaces = null,
    Object? selectedFilter = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? isLoadingNextPage = null,
    Object? selectedContentTypeId = freezed,
    Object? myTravelType = freezed,
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
      originalPlaces: null == originalPlaces
          ? _value.originalPlaces
          : originalPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      filteredPlaces: null == filteredPlaces
          ? _value.filteredPlaces
          : filteredPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as RegionFilter,
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
      selectedContentTypeId: freezed == selectedContentTypeId
          ? _value.selectedContentTypeId
          : selectedContentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      myTravelType: freezed == myTravelType
          ? _value.myTravelType
          : myTravelType // ignore: cast_nullable_to_non_nullable
              as TravelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendStateImplCopyWith<$Res>
    implements $RecommendStateCopyWith<$Res> {
  factory _$$RecommendStateImplCopyWith(_$RecommendStateImpl value,
          $Res Function(_$RecommendStateImpl) then) =
      __$$RecommendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiStatus status,
      String errorMessage,
      List<Place> originalPlaces,
      List<Place> filteredPlaces,
      RegionFilter selectedFilter,
      int currentPage,
      bool isLastPage,
      bool isLoadingNextPage,
      int? selectedContentTypeId,
      TravelType? myTravelType});
}

/// @nodoc
class __$$RecommendStateImplCopyWithImpl<$Res>
    extends _$RecommendStateCopyWithImpl<$Res, _$RecommendStateImpl>
    implements _$$RecommendStateImplCopyWith<$Res> {
  __$$RecommendStateImplCopyWithImpl(
      _$RecommendStateImpl _value, $Res Function(_$RecommendStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? originalPlaces = null,
    Object? filteredPlaces = null,
    Object? selectedFilter = null,
    Object? currentPage = null,
    Object? isLastPage = null,
    Object? isLoadingNextPage = null,
    Object? selectedContentTypeId = freezed,
    Object? myTravelType = freezed,
  }) {
    return _then(_$RecommendStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UiStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      originalPlaces: null == originalPlaces
          ? _value._originalPlaces
          : originalPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      filteredPlaces: null == filteredPlaces
          ? _value._filteredPlaces
          : filteredPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as RegionFilter,
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
      selectedContentTypeId: freezed == selectedContentTypeId
          ? _value.selectedContentTypeId
          : selectedContentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      myTravelType: freezed == myTravelType
          ? _value.myTravelType
          : myTravelType // ignore: cast_nullable_to_non_nullable
              as TravelType?,
    ));
  }
}

/// @nodoc

class _$RecommendStateImpl implements _RecommendState {
  const _$RecommendStateImpl(
      {this.status = UiStatus.idle,
      this.errorMessage = '',
      final List<Place> originalPlaces = const [],
      final List<Place> filteredPlaces = const [],
      this.selectedFilter = RegionFilter.all,
      this.currentPage = 0,
      this.isLastPage = false,
      this.isLoadingNextPage = false,
      this.selectedContentTypeId,
      this.myTravelType})
      : _originalPlaces = originalPlaces,
        _filteredPlaces = filteredPlaces;

  @override
  @JsonKey()
  final UiStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<Place> _originalPlaces;
  @override
  @JsonKey()
  List<Place> get originalPlaces {
    if (_originalPlaces is EqualUnmodifiableListView) return _originalPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_originalPlaces);
  }

  final List<Place> _filteredPlaces;
  @override
  @JsonKey()
  List<Place> get filteredPlaces {
    if (_filteredPlaces is EqualUnmodifiableListView) return _filteredPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredPlaces);
  }

  @override
  @JsonKey()
  final RegionFilter selectedFilter;
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
  final int? selectedContentTypeId;
  @override
  final TravelType? myTravelType;

  @override
  String toString() {
    return 'RecommendState(status: $status, errorMessage: $errorMessage, originalPlaces: $originalPlaces, filteredPlaces: $filteredPlaces, selectedFilter: $selectedFilter, currentPage: $currentPage, isLastPage: $isLastPage, isLoadingNextPage: $isLoadingNextPage, selectedContentTypeId: $selectedContentTypeId, myTravelType: $myTravelType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._originalPlaces, _originalPlaces) &&
            const DeepCollectionEquality()
                .equals(other._filteredPlaces, _filteredPlaces) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.isLoadingNextPage, isLoadingNextPage) ||
                other.isLoadingNextPage == isLoadingNextPage) &&
            (identical(other.selectedContentTypeId, selectedContentTypeId) ||
                other.selectedContentTypeId == selectedContentTypeId) &&
            (identical(other.myTravelType, myTravelType) ||
                other.myTravelType == myTravelType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_originalPlaces),
      const DeepCollectionEquality().hash(_filteredPlaces),
      selectedFilter,
      currentPage,
      isLastPage,
      isLoadingNextPage,
      selectedContentTypeId,
      myTravelType);

  /// Create a copy of RecommendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendStateImplCopyWith<_$RecommendStateImpl> get copyWith =>
      __$$RecommendStateImplCopyWithImpl<_$RecommendStateImpl>(
          this, _$identity);
}

abstract class _RecommendState implements RecommendState {
  const factory _RecommendState(
      {final UiStatus status,
      final String errorMessage,
      final List<Place> originalPlaces,
      final List<Place> filteredPlaces,
      final RegionFilter selectedFilter,
      final int currentPage,
      final bool isLastPage,
      final bool isLoadingNextPage,
      final int? selectedContentTypeId,
      final TravelType? myTravelType}) = _$RecommendStateImpl;

  @override
  UiStatus get status;
  @override
  String get errorMessage;
  @override
  List<Place> get originalPlaces;
  @override
  List<Place> get filteredPlaces;
  @override
  RegionFilter get selectedFilter;
  @override
  int get currentPage;
  @override
  bool get isLastPage;
  @override
  bool get isLoadingNextPage;
  @override
  int? get selectedContentTypeId;
  @override
  TravelType? get myTravelType;

  /// Create a copy of RecommendState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendStateImplCopyWith<_$RecommendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
