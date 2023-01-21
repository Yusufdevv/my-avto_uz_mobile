import 'dart:core';

import 'package:auto/features/car_single/domain/entities/price_analytics_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_analytics_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PriceAnalyticsModel extends PriceAnalyticsEntity {
   const PriceAnalyticsModel(
      {required super.priceDifference,
      required super.percentage,
      required super.averagePrice});

  factory PriceAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$PriceAnalyticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceAnalyticsModelToJson(this);
}
