import 'package:collection/collection.dart';

enum ContentTypeId {
  attraction('12'),
  culture('14'),
  event('15'),
  reports('28'),
  restaurant('39'),
  shopping('38'),
  stay('32');

  final String contentTypeId;
  const ContentTypeId(this.contentTypeId);

  static ContentTypeId? fromContentTypeId(String contentTypeId) {
    return ContentTypeId.values.firstWhereOrNull(
          (e) => e.contentTypeId == contentTypeId,
    );
  }
}