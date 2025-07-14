class Destination {
  final String sigunguCode;
  final bool isVisited;

  /// 생성자를 const로 변경하여 컴파일 타임 상수로 사용할 수 있게 합니다.
  const Destination({required this.sigunguCode, required this.isVisited});
}