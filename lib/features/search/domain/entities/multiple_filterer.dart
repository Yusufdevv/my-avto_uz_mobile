import 'package:auto/features/search/domain/entities/filterer.dart';

class MultipleFilterer {
  final String filterKey;
  final List<Filterer> filters;

  MultipleFilterer({this.filterKey = '', this.filters = const []});
}
