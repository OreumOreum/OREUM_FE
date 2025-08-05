import 'package:oreum_fe/features/place/data/repositories/place_repository_impl.dart';
import 'package:oreum_fe/features/place/data/services/place_service.dart';
import 'package:oreum_fe/features/place/domain/usecases/get_place_use_case.dart';
import 'package:oreum_fe/features/review/data/repositories/review_repository_impl.dart';
import 'package:oreum_fe/features/review/data/services/review_service.dart';
import 'package:oreum_fe/features/review/domain/repositories/review_repository.dart';
import 'package:oreum_fe/features/review/domain/usecases/get_place_reviews_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:oreum_fe/core/network/dio_providers.dart';

part 'review_providers.g.dart';

@riverpod
ReviewService reviewService(ReviewServiceRef ref) {
  final dio = ref.watch(dioProvider);
  return ReviewService(dio);
}

@riverpod
ReviewRepositoryImpl reviewRepositoryImpl(ReviewRepositoryImplRef ref) {
  final reviewService = ref.watch(reviewServiceProvider);
  return ReviewRepositoryImpl(reviewService);
}

@riverpod
GetPlaceReviewsUseCase getPlaceReviewsUseCase(GetPlaceReviewsUseCaseRef ref) {
  final reviewRepositoryImpl = ref.watch(reviewRepositoryImplProvider);
  return GetPlaceReviewsUseCase(reviewRepositoryImpl);
}