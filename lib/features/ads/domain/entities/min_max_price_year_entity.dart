import 'package:equatable/equatable.dart';

class MinMaxPriceYearEntity extends Equatable {
  const MinMaxPriceYearEntity({
    this.minPrice = '0',
    this.maxPrice = '0',
    this.minYear = 0,
    this.maxYear = 0,
  });

  MinMaxPriceYearEntity copyWithout({
    String? minPrice,
    String? maxPrice,
    int? minYear,
    int? maxYear,
  }) =>
      MinMaxPriceYearEntity(
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        minYear: minYear ?? this.minYear,
        maxYear: maxYear ?? this.maxYear,
      );

  final String minPrice;
  final String maxPrice;
  final int minYear;
  final int maxYear;

  @override
  List<Object?> get props => [
        minPrice,
        maxPrice,
        minYear,
        maxYear,
      ];
}
