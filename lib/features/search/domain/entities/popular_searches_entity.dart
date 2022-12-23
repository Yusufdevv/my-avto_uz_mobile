import 'package:auto/features/search/domain/entities/popular_searches_result_entity.dart';
import 'package:equatable/equatable.dart';

class PopularSearchesEntity extends Equatable {
  const PopularSearchesEntity({
    this.count = 0,
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  final int count;
  final String next;
  final String previous;
  @PopularSearchesResultConverter()
  final List<PopularSearchesResultEntity> results;

  @override
  List<Object?> get props => [count, next, previous, results];
}
