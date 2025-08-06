// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_place_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchPlaceResponse _$SearchPlaceResponseFromJson(Map<String, dynamic> json) {
  return _SearchPlaceResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchPlaceResponse {
  List<SearchPlaceItem> get content => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;

  /// Serializes this SearchPlaceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPlaceResponseCopyWith<SearchPlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlaceResponseCopyWith<$Res> {
  factory $SearchPlaceResponseCopyWith(
          SearchPlaceResponse value, $Res Function(SearchPlaceResponse) then) =
      _$SearchPlaceResponseCopyWithImpl<$Res, SearchPlaceResponse>;
  @useResult
  $Res call({List<SearchPlaceItem> content, bool isLastPage});
}

/// @nodoc
class _$SearchPlaceResponseCopyWithImpl<$Res, $Val extends SearchPlaceResponse>
    implements $SearchPlaceResponseCopyWith<$Res> {
  _$SearchPlaceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? isLastPage = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<SearchPlaceItem>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPlaceResponseImplCopyWith<$Res>
    implements $SearchPlaceResponseCopyWith<$Res> {
  factory _$$SearchPlaceResponseImplCopyWith(_$SearchPlaceResponseImpl value,
          $Res Function(_$SearchPlaceResponseImpl) then) =
      __$$SearchPlaceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchPlaceItem> content, bool isLastPage});
}

/// @nodoc
class __$$SearchPlaceResponseImplCopyWithImpl<$Res>
    extends _$SearchPlaceResponseCopyWithImpl<$Res, _$SearchPlaceResponseImpl>
    implements _$$SearchPlaceResponseImplCopyWith<$Res> {
  __$$SearchPlaceResponseImplCopyWithImpl(_$SearchPlaceResponseImpl _value,
      $Res Function(_$SearchPlaceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? isLastPage = null,
  }) {
    return _then(_$SearchPlaceResponseImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<SearchPlaceItem>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchPlaceResponseImpl implements _SearchPlaceResponse {
  const _$SearchPlaceResponseImpl(
      {final List<SearchPlaceItem> content = const [],
      required this.isLastPage})
      : _content = content;

  factory _$SearchPlaceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchPlaceResponseImplFromJson(json);

  final List<SearchPlaceItem> _content;
  @override
  @JsonKey()
  List<SearchPlaceItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'SearchPlaceResponse(content: $content, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPlaceResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_content), isLastPage);

  /// Create a copy of SearchPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPlaceResponseImplCopyWith<_$SearchPlaceResponseImpl> get copyWith =>
      __$$SearchPlaceResponseImplCopyWithImpl<_$SearchPlaceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchPlaceResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchPlaceResponse implements SearchPlaceResponse {
  const factory _SearchPlaceResponse(
      {final List<SearchPlaceItem> content,
      required final bool isLastPage}) = _$SearchPlaceResponseImpl;

  factory _SearchPlaceResponse.fromJson(Map<String, dynamic> json) =
      _$SearchPlaceResponseImpl.fromJson;

  @override
  List<SearchPlaceItem> get content;
  @override
  bool get isLastPage;

  /// Create a copy of SearchPlaceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPlaceResponseImplCopyWith<_$SearchPlaceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchPlaceItem _$SearchPlaceItemFromJson(Map<String, dynamic> json) {
  return _SearchPlaceItem.fromJson(json);
}

/// @nodoc
mixin _$SearchPlaceItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get thumbnailImage => throw _privateConstructorUsedError;

  /// Serializes this SearchPlaceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchPlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPlaceItemCopyWith<SearchPlaceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlaceItemCopyWith<$Res> {
  factory $SearchPlaceItemCopyWith(
          SearchPlaceItem value, $Res Function(SearchPlaceItem) then) =
      _$SearchPlaceItemCopyWithImpl<$Res, SearchPlaceItem>;
  @useResult
  $Res call({int id, String title, String? address, String? thumbnailImage});
}

/// @nodoc
class _$SearchPlaceItemCopyWithImpl<$Res, $Val extends SearchPlaceItem>
    implements $SearchPlaceItemCopyWith<$Res> {
  _$SearchPlaceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPlaceItemImplCopyWith<$Res>
    implements $SearchPlaceItemCopyWith<$Res> {
  factory _$$SearchPlaceItemImplCopyWith(_$SearchPlaceItemImpl value,
          $Res Function(_$SearchPlaceItemImpl) then) =
      __$$SearchPlaceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String? address, String? thumbnailImage});
}

/// @nodoc
class __$$SearchPlaceItemImplCopyWithImpl<$Res>
    extends _$SearchPlaceItemCopyWithImpl<$Res, _$SearchPlaceItemImpl>
    implements _$$SearchPlaceItemImplCopyWith<$Res> {
  __$$SearchPlaceItemImplCopyWithImpl(
      _$SearchPlaceItemImpl _value, $Res Function(_$SearchPlaceItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchPlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? address = freezed,
    Object? thumbnailImage = freezed,
  }) {
    return _then(_$SearchPlaceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchPlaceItemImpl implements _SearchPlaceItem {
  const _$SearchPlaceItemImpl(
      {required this.id,
      required this.title,
      this.address,
      this.thumbnailImage});

  factory _$SearchPlaceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchPlaceItemImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? address;
  @override
  final String? thumbnailImage;

  @override
  String toString() {
    return 'SearchPlaceItem(id: $id, title: $title, address: $address, thumbnailImage: $thumbnailImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPlaceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, address, thumbnailImage);

  /// Create a copy of SearchPlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPlaceItemImplCopyWith<_$SearchPlaceItemImpl> get copyWith =>
      __$$SearchPlaceItemImplCopyWithImpl<_$SearchPlaceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchPlaceItemImplToJson(
      this,
    );
  }
}

abstract class _SearchPlaceItem implements SearchPlaceItem {
  const factory _SearchPlaceItem(
      {required final int id,
      required final String title,
      final String? address,
      final String? thumbnailImage}) = _$SearchPlaceItemImpl;

  factory _SearchPlaceItem.fromJson(Map<String, dynamic> json) =
      _$SearchPlaceItemImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get address;
  @override
  String? get thumbnailImage;

  /// Create a copy of SearchPlaceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPlaceItemImplCopyWith<_$SearchPlaceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
