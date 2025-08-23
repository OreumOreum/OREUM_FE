import 'package:oreum_fe/features/home/data/models/category_recommend_response.dart';

import '../../data/models/place_response.dart';
import '../../data/models/type_recommend_response.dart';

abstract class PlaceRepository {
  Future<PageablePlaceResponse> getPlaces({
    required int contentTypeId,
    int? sigunguCode,
    bool? type,
    Map<String, dynamic>? pageable,
  });
  Future<List<CategoryRecommendResponse>> getRecommendPlace();
  Future<List<Place>> getTypeRecommend();
}