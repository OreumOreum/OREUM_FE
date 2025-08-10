import 'package:oreum_fe/features/tour/data/models/tour_response.dart';
import 'package:oreum_fe/features/tour/data/services/tour_service.dart';
import 'package:oreum_fe/features/tour/domain/repositories/tour_repository.dart';

class TourRepositoryImpl implements TourRepository{
  final TourService _tourService;
  TourRepositoryImpl(this._tourService);

  @override
  Future<TourResponse> getTourApi(String contentId, String contentTypeId) {
    return _tourService.getTourApi(contentId, contentTypeId);
  }
}