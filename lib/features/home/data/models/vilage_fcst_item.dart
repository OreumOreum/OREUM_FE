import 'package:freezed_annotation/freezed_annotation.dart';

part 'vilage_fcst_item.freezed.dart';
part 'vilage_fcst_item.g.dart';

@freezed
class VilageFcstItem with _$VilageFcstItem {
  const factory VilageFcstItem({
    required String category,
    required String fcstDate,
    required String fcstTime,
    required String fcstValue,
  }) = _VilageFcstItem;

  factory VilageFcstItem.fromJson(Map<String, dynamic> json) =>
      _$VilageFcstItemFromJson(json);
}
