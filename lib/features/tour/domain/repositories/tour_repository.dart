
import 'package:oreum_fe/features/tour/data/models/tour_response.dart';

abstract class TourRepository {
  Future<TourResponse> getTourApi(String contentId, String contentTypeId);
}