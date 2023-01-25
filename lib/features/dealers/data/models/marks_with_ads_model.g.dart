// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks_with_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarksWithAdsModel _$MarksWithAdsModelFromJson(Map<String, dynamic> json) =>
    MarksWithAdsModel(
      carsCount: json['cars_count'] as int? ?? 0,
      make: json['make'] == null
          ? const DealerMakeEntity()
          : const DealerMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MarksWithAdsModelToJson(MarksWithAdsModel instance) =>
    <String, dynamic>{
      'make': const DealerMakeConverter().toJson(instance.make),
      'cars_count': instance.carsCount,
    };
