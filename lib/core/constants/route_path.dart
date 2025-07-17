abstract class RoutePath {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String typeTestStart = '/typeTestStart';
  static const String typeTest = '/typeTest';
  static const String typeTestResult = '/typeTestResult';
  static const String home = '/home';
  static const String planner = '/planner';
  static String plannerDetail(int id) => '/planner/$id';
  static String plannerDay(int id, int day) => '/planner/$id/day/$day';
  static String plannerEditWithId(String id) => '/planner/$id/edit';
  static const String recommend = '/recommend';

  static const String createReview = '/createReview';
  static const String reviewDetail = '/reviewDetail';
  static const String myReview = '/myReview';
  static const String travelCourse = '/travelCourse';
  static const String travelSpot = '/travelSpot';


  static const String search = '/search';
  static const String setting = '/setting';
  static const String accountSetting = '/accountSetting';
  static const String monthlySpot = '/monthlySpot';
  static const String monthlySpotDetail = '/monthlySpotDetail';
  static const String monthlySpotMap = '/monthlySpotMap';
  static const String monthlySpotRanking = '/monthlySpotRanking';

  static const String folderList = '/folderList';
  static const String folderDetail = '/folderDetail';


}