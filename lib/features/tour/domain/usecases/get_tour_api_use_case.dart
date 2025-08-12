import 'package:oreum_fe/features/tour/data/models/tour_response.dart';
import 'package:oreum_fe/features/tour/domain/repositories/tour_repository.dart';

class GetTourApiUseCase{
  final TourRepository _tourRepository;
  GetTourApiUseCase(this._tourRepository);

  Future<TourResponse> call(String contentId, String contentTypeId) async {
    final TourResponse tour = await _tourRepository.getTourApi(contentId, contentTypeId);
    return tour;
  }
}