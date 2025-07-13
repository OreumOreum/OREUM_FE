abstract class IconPath {
  static const String appIconSplash = 'assets/icons/app_icon_splash.svg';
  static const String appIconAppBar = 'assets/icons/app_icon_app_bar.svg';

  static const String backAppBar = 'assets/icons/back_app_bar.svg';

  static const String dots = 'assets/icons/dots.svg';
  static const String plus = 'assets/icons/plus.svg';
  static const String cancel = 'assets/icons/cancel.svg';
  static const String search = 'assets/icons/search.svg';
  static const String banner = 'assets/icons/banner.svg';

  static const String kakao = 'assets/icons/kakao.svg';
  static const String apple = 'assets/icons/apple.svg';
  static const String google = 'assets/icons/google.svg';

  static String typeTestStatus(String status) => 'assets/icons/type_test_$status.svg';
  static const String typeTestUnselectedSM ='assets/icons/type_test_unselected_sm.svg';

  ///이미지 만들어지면 열거형.name으로 불러오기
  static String typeImage(String type) => 'assets/icons/type_$type.svg';
  static String largeCategoryImage(String type) => 'assets/icons/large_category_$type.svg';

  static const String cloud = 'assets/icons/cloud.svg';

  static const String bookmarkOutline = 'assets/icons/bookmark_outline.svg';
  static const String star = 'assets/icons/star.svg';
  static const String star2 = 'assets/icons/star2.svg';
}