// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiCancelledExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ApiCancelledExceptionImplCopyWith(
          _$ApiCancelledExceptionImpl value,
          $Res Function(_$ApiCancelledExceptionImpl) then) =
      __$$ApiCancelledExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ApiCancelledExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ApiCancelledExceptionImpl>
    implements _$$ApiCancelledExceptionImplCopyWith<$Res> {
  __$$ApiCancelledExceptionImplCopyWithImpl(_$ApiCancelledExceptionImpl _value,
      $Res Function(_$ApiCancelledExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ApiCancelledExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApiCancelledExceptionImpl implements ApiCancelledException {
  const _$ApiCancelledExceptionImpl([this.message = 'API 호출이 취소되었습니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.apiCancelled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiCancelledExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiCancelledExceptionImplCopyWith<_$ApiCancelledExceptionImpl>
      get copyWith => __$$ApiCancelledExceptionImplCopyWithImpl<
          _$ApiCancelledExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return apiCancelled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return apiCancelled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (apiCancelled != null) {
      return apiCancelled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return apiCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return apiCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (apiCancelled != null) {
      return apiCancelled(this);
    }
    return orElse();
  }
}

abstract class ApiCancelledException implements AppException {
  const factory ApiCancelledException([final String message]) =
      _$ApiCancelledExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiCancelledExceptionImplCopyWith<_$ApiCancelledExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HttpExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$HttpExceptionImplCopyWith(
          _$HttpExceptionImpl value, $Res Function(_$HttpExceptionImpl) then) =
      __$$HttpExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HttpExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$HttpExceptionImpl>
    implements _$$HttpExceptionImplCopyWith<$Res> {
  __$$HttpExceptionImplCopyWithImpl(
      _$HttpExceptionImpl _value, $Res Function(_$HttpExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$HttpExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpExceptionImpl implements HttpException {
  const _$HttpExceptionImpl([this.message = 'HTTP 오류가 발생했습니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.http(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpExceptionImplCopyWith<_$HttpExceptionImpl> get copyWith =>
      __$$HttpExceptionImplCopyWithImpl<_$HttpExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return http(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return http?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (http != null) {
      return http(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return http(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return http?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (http != null) {
      return http(this);
    }
    return orElse();
  }
}

abstract class HttpException implements AppException {
  const factory HttpException([final String message]) = _$HttpExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpExceptionImplCopyWith<_$HttpExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(_$NetworkExceptionImpl value,
          $Res Function(_$NetworkExceptionImpl) then) =
      __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(_$NetworkExceptionImpl _value,
      $Res Function(_$NetworkExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkExceptionImpl implements NetworkException {
  const _$NetworkExceptionImpl([this.message = '인터넷 연결을 확인해주세요']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkException implements AppException {
  const factory NetworkException([final String message]) =
      _$NetworkExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NotFoundExceptionImplCopyWith(_$NotFoundExceptionImpl value,
          $Res Function(_$NotFoundExceptionImpl) then) =
      __$$NotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotFoundExceptionImpl>
    implements _$$NotFoundExceptionImplCopyWith<$Res> {
  __$$NotFoundExceptionImplCopyWithImpl(_$NotFoundExceptionImpl _value,
      $Res Function(_$NotFoundExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundExceptionImpl implements NotFoundException {
  const _$NotFoundExceptionImpl([this.message = '요청한 리소스를 찾을 수 없습니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      __$$NotFoundExceptionImplCopyWithImpl<_$NotFoundExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException implements AppException {
  const factory NotFoundException([final String message]) =
      _$NotFoundExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$PermissionExceptionImplCopyWith(_$PermissionExceptionImpl value,
          $Res Function(_$PermissionExceptionImpl) then) =
      __$$PermissionExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$PermissionExceptionImpl>
    implements _$$PermissionExceptionImplCopyWith<$Res> {
  __$$PermissionExceptionImplCopyWithImpl(_$PermissionExceptionImpl _value,
      $Res Function(_$PermissionExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PermissionExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionExceptionImpl implements PermissionException {
  const _$PermissionExceptionImpl([this.message = '권한이 없습니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.permission(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionExceptionImplCopyWith<_$PermissionExceptionImpl> get copyWith =>
      __$$PermissionExceptionImplCopyWithImpl<_$PermissionExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return permission(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return permission?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return permission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return permission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this);
    }
    return orElse();
  }
}

abstract class PermissionException implements AppException {
  const factory PermissionException([final String message]) =
      _$PermissionExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionExceptionImplCopyWith<_$PermissionExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl implements ServerException {
  const _$ServerExceptionImpl([this.message = '서버 오류가 발생했습니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerException implements AppException {
  const factory ServerException([final String message]) = _$ServerExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnauthorizedExceptionImplCopyWith(
          _$UnauthorizedExceptionImpl value,
          $Res Function(_$UnauthorizedExceptionImpl) then) =
      __$$UnauthorizedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnauthorizedExceptionImpl>
    implements _$$UnauthorizedExceptionImplCopyWith<$Res> {
  __$$UnauthorizedExceptionImplCopyWithImpl(_$UnauthorizedExceptionImpl _value,
      $Res Function(_$UnauthorizedExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedExceptionImpl implements UnauthorizedException {
  const _$UnauthorizedExceptionImpl([this.message = '권한이 없습니다.']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => __$$UnauthorizedExceptionImplCopyWithImpl<
          _$UnauthorizedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException implements AppException {
  const factory UnauthorizedException([final String message]) =
      _$UnauthorizedExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(_$UnknownExceptionImpl value,
          $Res Function(_$UnknownExceptionImpl) then) =
      __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(_$UnknownExceptionImpl _value,
      $Res Function(_$UnknownExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownExceptionImpl implements UnknownException {
  const _$UnknownExceptionImpl([this.message = '알 수 없는 오류 입니다']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) apiCancelled,
    required TResult Function(String message) http,
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) permission,
    required TResult Function(String message) server,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? apiCancelled,
    TResult? Function(String message)? http,
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? permission,
    TResult? Function(String message)? server,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? apiCancelled,
    TResult Function(String message)? http,
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? permission,
    TResult Function(String message)? server,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiCancelledException value) apiCancelled,
    required TResult Function(HttpException value) http,
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(PermissionException value) permission,
    required TResult Function(ServerException value) server,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiCancelledException value)? apiCancelled,
    TResult? Function(HttpException value)? http,
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(PermissionException value)? permission,
    TResult? Function(ServerException value)? server,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiCancelledException value)? apiCancelled,
    TResult Function(HttpException value)? http,
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(PermissionException value)? permission,
    TResult Function(ServerException value)? server,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownException implements AppException {
  const factory UnknownException([final String message]) =
      _$UnknownExceptionImpl;

  @override
  String get message;

  /// Create a copy of AppException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
