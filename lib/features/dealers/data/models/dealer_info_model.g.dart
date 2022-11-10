// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerInfoModel _$DealerInfoModelFromJson(Map<String, dynamic> json) =>
    DealerInfoModel(
      additionalInfo: json['additional_info'] as String,
      contact: json['contact'] as String,
      dealerImageUrl: json['dealer_image_url'] as String,
      dealerName: json['dealer_name'] as String,
      dealerType: json['dealer_type'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      quantityOfCars: json['quantity_of_cars'] as int,
      workingHours: json['working_hours'] as String,
    );

Map<String, dynamic> _$DealerInfoModelToJson(DealerInfoModel instance) =>
    <String, dynamic>{
      'dealer_type': instance.dealerType,
      'dealer_name': instance.dealerName,
      'dealer_image_url': instance.dealerImageUrl,
      'quantity_of_cars': instance.quantityOfCars,
      'working_hours': instance.workingHours,
      'contact': instance.contact,
      'additional_info': instance.additionalInfo,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
