import 'package:freezed_annotation/freezed_annotation.dart';

part 'ultra_srt_item.freezed.dart';
part 'ultra_srt_item.g.dart';

@freezed
class UltraSrtItem with _$UltraSrtItem {
  const factory UltraSrtItem({
    required String baseDate,
    required String baseTime,
    required String category,
    required int nx,
    required int ny,
    required String obsrValue,
  }) = _UltraSrtItem;

  factory UltraSrtItem.fromJson(Map<String, dynamic> json) =>
      _$UltraSrtItemFromJson(json);
}