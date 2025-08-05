import 'package:oreum_fe/core/constants/travel_type.dart';
// setting 기능의 provider들을 import 합니다.
import 'package:oreum_fe/features/setting/di/setting_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_type_provider.g.dart';

@Riverpod(keepAlive: true)
class MyTravelType extends _$MyTravelType {
  @override
  Future<TravelType> build() async {
    final usecase = ref.read(getMyInfoUseCaseProvider);
    final myInfo = await usecase.call();
    final categoryString = myInfo.categoryType ?? 'activity';

    final myType = TravelType.values.firstWhere(
          (e) => e.name.toLowerCase() == categoryString.toLowerCase(),
      orElse: () => TravelType.activity,
    );

    return myType;
  }
}