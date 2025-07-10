// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypeTestState {
  List<TypeQuestion> get questions => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  /// Create a copy of TypeTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeTestStateCopyWith<TypeTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeTestStateCopyWith<$Res> {
  factory $TypeTestStateCopyWith(
          TypeTestState value, $Res Function(TypeTestState) then) =
      _$TypeTestStateCopyWithImpl<$Res, TypeTestState>;
  @useResult
  $Res call({List<TypeQuestion> questions, int currentIndex});
}

/// @nodoc
class _$TypeTestStateCopyWithImpl<$Res, $Val extends TypeTestState>
    implements $TypeTestStateCopyWith<$Res> {
  _$TypeTestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TypeQuestion>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeTestStateImplCopyWith<$Res>
    implements $TypeTestStateCopyWith<$Res> {
  factory _$$TypeTestStateImplCopyWith(
          _$TypeTestStateImpl value, $Res Function(_$TypeTestStateImpl) then) =
      __$$TypeTestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TypeQuestion> questions, int currentIndex});
}

/// @nodoc
class __$$TypeTestStateImplCopyWithImpl<$Res>
    extends _$TypeTestStateCopyWithImpl<$Res, _$TypeTestStateImpl>
    implements _$$TypeTestStateImplCopyWith<$Res> {
  __$$TypeTestStateImplCopyWithImpl(
      _$TypeTestStateImpl _value, $Res Function(_$TypeTestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeTestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? currentIndex = null,
  }) {
    return _then(_$TypeTestStateImpl(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<TypeQuestion>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TypeTestStateImpl implements _TypeTestState {
  const _$TypeTestStateImpl(
      {required final List<TypeQuestion> questions, required this.currentIndex})
      : _questions = questions;

  final List<TypeQuestion> _questions;
  @override
  List<TypeQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'TypeTestState(questions: $questions, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeTestStateImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_questions), currentIndex);

  /// Create a copy of TypeTestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeTestStateImplCopyWith<_$TypeTestStateImpl> get copyWith =>
      __$$TypeTestStateImplCopyWithImpl<_$TypeTestStateImpl>(this, _$identity);
}

abstract class _TypeTestState implements TypeTestState {
  const factory _TypeTestState(
      {required final List<TypeQuestion> questions,
      required final int currentIndex}) = _$TypeTestStateImpl;

  @override
  List<TypeQuestion> get questions;
  @override
  int get currentIndex;

  /// Create a copy of TypeTestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeTestStateImplCopyWith<_$TypeTestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
