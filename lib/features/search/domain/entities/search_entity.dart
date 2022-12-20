import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';

class SearchEntity {
  SearchEntity({
    this.count = 0,
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  final int count;
  final String next;
  final String previous;
  final List<CommercialItemEntity> results;
}
