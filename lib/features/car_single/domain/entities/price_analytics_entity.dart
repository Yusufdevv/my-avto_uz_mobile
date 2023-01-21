import 'package:auto/features/car_single/data/model/price_analytics_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PriceAnalyticsEntity extends Equatable {
  final double averagePrice;
  final double priceDifference;
  final double percentage;

  const PriceAnalyticsEntity({
    this.averagePrice = 0,
    this.percentage = 0,
    this.priceDifference = 0,
  });

  @override
  List<Object?> get props => [
        averagePrice,
        percentage,
        priceDifference,
      ];
}

class PriceAnalyticsConverter
    implements JsonConverter<PriceAnalyticsEntity, Map<String, dynamic>?> {
  const PriceAnalyticsConverter();

  @override
  PriceAnalyticsEntity fromJson(Map<String, dynamic>? json) =>
      PriceAnalyticsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(PriceAnalyticsEntity object) => {};
}
