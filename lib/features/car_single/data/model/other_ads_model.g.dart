// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherAdsModel _$OtherAdsModelFromJson(Map<String, dynamic> json) =>
    OtherAdsModel(
      model: json['model'] as String? ?? '',
      location: json['location'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      characteristic: json['characteristic'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$OtherAdsModelToJson(OtherAdsModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'model': instance.model,
      'price': instance.price,
      'location': instance.location,
      'characteristic': instance.characteristic,
    };
