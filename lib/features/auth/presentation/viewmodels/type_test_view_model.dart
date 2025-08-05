import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oreum_fe/features/auth/di/auth_providers.dart';
import 'package:oreum_fe/features/auth/domain/usecases/skip_type_test_use_case.dart';
import 'package:oreum_fe/features/auth/domain/usecases/submit_type_test_result_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/core/constants/travel_type.dart';
import 'package:oreum_fe/features/auth/domain/entities/type_question.dart';
import 'package:oreum_fe/features/auth/presentation/viewmodels/states/type_test_state.dart';

part 'type_test_view_model.g.dart';

final _initialQuestions = <TypeQuestion>[
  /// 익스트림 챌린저
  TypeQuestion(questionText: '여행 중에는 땀 흘리며 움직이는 게 가장 즐겁다.', type: TravelType.ACTIVITY),
  TypeQuestion(questionText: '즉흥적으로 새로운 체험을 시도하는 걸 좋아한다.', type: TravelType.ACTIVITY),
  TypeQuestion(questionText: '아찔하거나 도전적인 액티비티가 끌린다.', type: TravelType.ACTIVITY),

  /// 무드 스포터
  TypeQuestion(questionText: '예쁜 카페나 감성적인 공간을 일부러 찾아간다.', type: TravelType.MOOD),
  TypeQuestion(questionText: '인테리어나 분위기를 중요하게 여긴다.', type: TravelType.MOOD),
  TypeQuestion(questionText: 'SNS에 공유하고 싶은 공간 사진을 자주 찍는다.', type: TravelType.MOOD),

  /// 푸드 노마드
  TypeQuestion(questionText: '여행의 핵심은 맛있는 음식을 먹는 것이다.', type: TravelType.FOOD),
  TypeQuestion(questionText: '미리 맛집을 찾아보고 리스트업하는 편이다.', type: TravelType.FOOD),
  TypeQuestion(questionText: '현지 로컬 음식은 꼭 먹어봐야 한다고 생각한다.', type: TravelType.FOOD),

  /// 포레스트 힐러
  TypeQuestion(questionText: '복잡한 도시보다 자연에서 쉬는 것이 더 좋다.', type: TravelType.FOREST),
  TypeQuestion(questionText: '조용한 풍경 속에서 사진 찍는 것을 즐긴다.', type: TravelType.FOREST),
  TypeQuestion(questionText: '여행은 ‘쉼’이 가장 중요하다고 생각한다.', type: TravelType.FOREST),

  /// 컬처 시커
  TypeQuestion(questionText: '여행지를 가면 박물관이나 전시를 꼭 간다.', type: TravelType.CULTURE),
  TypeQuestion(questionText: '그 지역의 역사나 전통을 알아보는 게 재미있다.', type: TravelType.CULTURE),
  TypeQuestion(questionText: '관광보단 로컬 문화를 느끼는 게 더 중요하다.', type: TravelType.CULTURE),

  /// 소셜 트래블러
  TypeQuestion(questionText: '새로운 사람과 어울리는 걸 좋아한다.', type: TravelType.SOCIAL),
  TypeQuestion(questionText: '혼자 여행 가도 현지에서 친구를 사귄다.', type: TravelType.SOCIAL),
  TypeQuestion(questionText: '밤엔 파티나 펍 같은 활동을 즐긴다.', type: TravelType.SOCIAL),
];

@riverpod
class TypeTestViewModel extends _$TypeTestViewModel {
  @override
  TypeTestState build() {
    return TypeTestState(questions: _initialQuestions, currentIndex: 0);
  }

  void selectScore(int score) {
    final updatedQuestions = [
      for (int i = 0; i < state.questions.length; i++)
        if (i == state.currentIndex)
          state.questions[i].copyWith(
            selectedScore:
            state.questions[i].selectedScore == score ? null : score,
          )
        else
          state.questions[i],
    ];
    state = state.copyWith(questions: updatedQuestions);
  }

  void goNext() {
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void goPrev() {
    final currentIdx = state.currentIndex;
    if (currentIdx > 0) {
      final updatedQuestions = [...state.questions];

      final currentQuestion = updatedQuestions[currentIdx];
      updatedQuestions[currentIdx] =
          currentQuestion.copyWith(selectedScore: null);

      state = state.copyWith(
        currentIndex: currentIdx - 1,
        questions: updatedQuestions,
      );
    }
  }

  bool get canGoNext =>
      state.questions[state.currentIndex].selectedScore != null;

  bool get isLastQuestion =>
      state.currentIndex == state.questions.length - 1;

  TravelType calculateResult() {
    final Map<TravelType, int> scoreMap = {};
    for (final q in state.questions) {
      scoreMap[q.type] = (scoreMap[q.type] ?? 0) + (q.selectedScore ?? 0);
    }

    final priorityOrder = [
      TravelType.ACTIVITY,
      TravelType.MOOD,
      TravelType.FOOD,
      TravelType.FOREST,
      TravelType.CULTURE,
      TravelType.SOCIAL,
    ];

    final maxScore = scoreMap.values.fold<int>(0, (a, b) => a > b ? a : b);
    final topTypes = scoreMap.entries
        .where((e) => e.value == maxScore)
        .map((e) => e.key)
        .toList();

    TravelType type = priorityOrder.firstWhere((t) => topTypes.contains(t));

    state = state.copyWith(type: type);

    return type;
  }

  Future<void> skipTypeTest() async {
    SkipTypeTestUseCase skipTypeTestUseCase = ref.read(skipTypeTestUseCaseProvider);
    await skipTypeTestUseCase.call();
  }

  Future<void> submitTypeTestResult(String type) async {
    SubmitTypeTestResultUseCase submitTypeTestResultUseCase = ref.read(submitTypeTestResultUseCaseProvider);
    await submitTypeTestResultUseCase.call(type);
  }
}
