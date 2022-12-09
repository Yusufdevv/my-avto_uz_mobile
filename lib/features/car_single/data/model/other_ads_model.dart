import 'dart:core';

import 'package:auto/features/car_single/domain/entities/other_ads_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_ads_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OtherAdsModel extends OtherAdsEntity {
  OtherAdsModel(
      {required super.model,
      required super.location,
      required super.imageUrl,
      required super.characteristic,
      required super.price});

  factory OtherAdsModel.fromJson(Map<String, dynamic> json) => _$OtherAdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtherAdsModelToJson(this);
}

class DistrictConverter implements JsonConverter<OtherAdsEntity, Map<String, dynamic>?> {
  const DistrictConverter();

  @override
  OtherAdsEntity fromJson(Map<String, dynamic>? json) => OtherAdsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(OtherAdsEntity object) => {};
}
