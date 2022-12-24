// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks_with_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarksWithAdsModel _$MarksWithAdsModelFromJson(Map<String, dynamic> json) =>
    MarksWithAdsModel(
      imageUrl: json['image_url'] as String,
      mark: json['mark'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$MarksWithAdsModelToJson(MarksWithAdsModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'mark': instance.mark,
      'quantity': instance.quantity,
    };
