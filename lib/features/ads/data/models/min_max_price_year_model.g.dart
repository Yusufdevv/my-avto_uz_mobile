// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'min_max_price_year_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinMaxPriceYearModel _$MinMaxPriceYearModelFromJson(
        Map<String, dynamic> json) =>
    MinMaxPriceYearModel(
      minPrice: json['min_price'] as String? ?? '0',
      maxPrice: json['max_price'] as String? ?? '0',
      minYear: json['min_year'] as int? ?? 0,
      maxYear: json['max_year'] as int? ?? 0,
    );

Map<String, dynamic> _$MinMaxPriceYearModelToJson(
        MinMaxPriceYearModel instance) =>
    <String, dynamic>{
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'min_year': instance.minYear,
      'max_year': instance.maxYear,
    };
