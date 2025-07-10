// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypeQuestion {
  String get questionText => throw _privateConstructorUsedError;
  TravelType get type => throw _privateConstructorUsedError;
  int? get selectedScore => throw _privateConstructorUsedError;

  /// Create a copy of TypeQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeQuestionCopyWith<TypeQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeQuestionCopyWith<$Res> {
  factory $TypeQuestionCopyWith(
          TypeQuestion value, $Res Function(TypeQuestion) then) =
      _$TypeQuestionCopyWithImpl<$Res, TypeQuestion>;
  @useResult
  $Res call({String questionText, TravelType type, int? selectedScore});
}

/// @nodoc
class _$TypeQuestionCopyWithImpl<$Res, $Val extends TypeQuestion>
    implements $TypeQuestionCopyWith<$Res> {
  _$TypeQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionText = null,
    Object? type = null,
    Object? selectedScore = freezed,
  }) {
    return _then(_value.copyWith(
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelType,
      selectedScore: freezed == selectedScore
          ? _value.selectedScore
          : selectedScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeQuestionImplCopyWith<$Res>
    implements $TypeQuestionCopyWith<$Res> {
  factory _$$TypeQuestionImplCopyWith(
          _$TypeQuestionImpl value, $Res Function(_$TypeQuestionImpl) then) =
      __$$TypeQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionText, TravelType type, int? selectedScore});
}

/// @nodoc
class __$$TypeQuestionImplCopyWithImpl<$Res>
    extends _$TypeQuestionCopyWithImpl<$Res, _$TypeQuestionImpl>
    implements _$$TypeQuestionImplCopyWith<$Res> {
  __$$TypeQuestionImplCopyWithImpl(
      _$TypeQuestionImpl _value, $Res Function(_$TypeQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionText = null,
    Object? type = null,
    Object? selectedScore = freezed,
  }) {
    return _then(_$TypeQuestionImpl(
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelType,
      selectedScore: freezed == selectedScore
          ? _value.selectedScore
          : selectedScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TypeQuestionImpl implements _TypeQuestion {
  const _$TypeQuestionImpl(
      {required this.questionText, required this.type, this.selectedScore});

  @override
  final String questionText;
  @override
  final TravelType type;
  @override
  final int? selectedScore;

  @override
  String toString() {
    return 'TypeQuestion(questionText: $questionText, type: $type, selectedScore: $selectedScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeQuestionImpl &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.selectedScore, selectedScore) ||
                other.selectedScore == selectedScore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, questionText, type, selectedScore);

  /// Create a copy of TypeQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeQuestionImplCopyWith<_$TypeQuestionImpl> get copyWith =>
      __$$TypeQuestionImplCopyWithImpl<_$TypeQuestionImpl>(this, _$identity);
}

abstract class _TypeQuestion implements TypeQuestion {
  const factory _TypeQuestion(
      {required final String questionText,
      required final TravelType type,
      final int? selectedScore}) = _$TypeQuestionImpl;

  @override
  String get questionText;
  @override
  TravelType get type;
  @override
  int? get selectedScore;

  /// Create a copy of TypeQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeQuestionImplCopyWith<_$TypeQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
