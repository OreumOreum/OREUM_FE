import 'package:oreum_fe/features/home/data/models/category_recommend_response.dart';

import '../../domain/repositories/place_repository.dart';
import '../models/place_response.dart';
import '../services/place_service.dart';

class PlaceRepositoryImpl implements PlaceRepository {
  final PlaceService _service;
  PlaceRepositoryImpl(this._service);

  @override
  Future<PageablePlaceResponse> getPlaces({
    required int contentTypeId,
    int? sigunguCode,
    bool? type,
    Map<String, dynamic>? pageable,
  }) {
    return _service.getPlaces(
      contentTypeId: contentTypeId,
      sigunguCode: sigunguCode,
      type: type,
      pageable: pageable,
    );
  }
  @override
  Future<List<CategoryRecommendResponse>> getRecommendPlace() {
    return _service.getRecommendPlace();
  }
  @override
  Future<List<Place>> getTypeRecommend() {
    return _service.getTypeRecommend();
  }
}