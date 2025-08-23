import 'package:oreum_fe/features/course/data/models/course_response.dart';
import 'package:oreum_fe/features/course/domain/repositories/course_repository.dart';
import 'package:oreum_fe/features/home/data/models/category_recommend_response.dart';
import 'package:oreum_fe/features/home/data/models/type_recommend_response.dart';
import 'package:oreum_fe/features/home/domain/repositories/place_repository.dart';

import '../../data/models/place_response.dart';



class GetTypeRecommendUseCase{
  final PlaceRepository _placeRepository;
  GetTypeRecommendUseCase(this._placeRepository);

  Future<List<Place>> call() async {
    final List<Place> typePlaces = await _placeRepository.getTypeRecommend();
    return typePlaces;
  }
}