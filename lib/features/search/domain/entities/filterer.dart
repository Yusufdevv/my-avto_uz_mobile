class Filterer {
  final String filterKey;
  final String value;
  final int id;

  const Filterer({
    this.id = 0,
    this.filterKey = '',
    this.value = '',
  });

  Map<String, dynamic> toFilterMap() => {filterKey: value};
}
