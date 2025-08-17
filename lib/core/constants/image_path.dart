abstract class ImagePath {
  static const banner = 'assets/images/banner.png';
  static const tangerine = 'assets/images/tangerine.png';
  static const mountain = 'assets/images/mountain.png';
  static const imageError = 'assets/images/image_error.png';
  static const all = 'assets/images/all.png';
  static String typeImage(String type) => 'assets/images/type_$type.png';
  static String typeProfile(String type) => 'assets/images/profile_$type.png';
  static const error = 'assets/images/error.png';
  static String badge(String badgeName) => 'assets/images/$badgeName.png';
}