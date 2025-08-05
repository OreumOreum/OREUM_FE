import 'package:flutter/material.dart';
import 'package:oreum_fe/core/utils/date_time_utils.dart';
import 'package:oreum_fe/features/spot/data/models/spot_month_response.dart';
import 'package:oreum_fe/features/spot/data/models/spot_response.dart';
import 'package:oreum_fe/features/spot/domain/repositories/spot_repository.dart';

class GetYearSpotUseCase{
  final SpotRepository _spotRepository;
  GetYearSpotUseCase(this._spotRepository);
  Future<List<SpotResponse>> call() async{
    String? year = await DateTimeUtils.getNtpYearAsString();
    List<SpotResponse> spots = await _spotRepository.getYearSpot(year!);
    return spots;
  }
}