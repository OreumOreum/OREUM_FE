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
}