import 'package:auto/features/ads/domain/entities/min_max_price_year_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'min_max_price_year_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MinMaxPriceYearModel extends MinMaxPriceYearEntity {
  const MinMaxPriceYearModel({
    required super.minPrice,
    required super.maxPrice,
    required super.minYear,
    required super.maxYear,
  });

  factory MinMaxPriceYearModel.fromJson(Map<String, dynamic> json) =>
      _$MinMaxPriceYearModelFromJson(json);

  Map<String, dynamic> toJson() => _$MinMaxPriceYearModelToJson(this);
}
