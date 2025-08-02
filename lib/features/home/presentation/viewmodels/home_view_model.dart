import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/di/course_providers.dart';
import 'package:oreum_fe/features/course/domain/usecases/get_course_list_use_case.dart';
import 'package:oreum_fe/features/home/presentation/viewmodels/states/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> initializeHome() async {
    state = state.copyWith(status: HomeStatus.loading);
    try {
      final GetCourseListUseCase getCourseListUseCase = ref.read(getCourseListUseCaseProvider);
      List<CourseResponse> courses = await getCourseListUseCase.call();
      state = state.copyWith(status: HomeStatus.success, courses: courses);
    }
    catch(e){
      state = state.copyWith(status: HomeStatus.error, errorMessage: e.toString());
      print('errorMessage: ${e.toString()}');
    }
  }
}