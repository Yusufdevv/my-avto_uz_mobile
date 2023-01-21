// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceAnalyticsModel _$PriceAnalyticsModelFromJson(Map<String, dynamic> json) =>
    PriceAnalyticsModel(
      priceDifference: (json['price_difference'] as num?)?.toDouble() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
      averagePrice: (json['average_price'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PriceAnalyticsModelToJson(
        PriceAnalyticsModel instance) =>
    <String, dynamic>{
      'average_price': instance.averagePrice,
      'price_difference': instance.priceDifference,
      'percentage': instance.percentage,
    };
