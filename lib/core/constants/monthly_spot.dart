class Spot {
  final int spotId;
  final int placeId;
  final String title;
  final String address;
  final String thumbnailImage;
  final int sigunguCode;
  final bool isVisit;

  const Spot({
    required this.spotId,
    required this.placeId,
    required this.title,
    required this.address,
    required this.thumbnailImage,
    required this.sigunguCode,
    required this.isVisit,
  });
}

class SpotRankInfo {
  final int rank;
  final String categoryType;
  final int visitCount;

  const SpotRankInfo({
    required this.rank,
    required this.categoryType,
    required this.visitCount,
  });
}