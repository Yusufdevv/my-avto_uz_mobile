class ReviewsModel {
  const ReviewsModel({
    this.generation,
    this.make,
    this.model,
    this.search,
    this.year,
  });
  final String? search;
  final String? make;
  final String? model;
  final int? year;
  final String? generation;
}
