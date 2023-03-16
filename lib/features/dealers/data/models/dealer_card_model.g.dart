// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerCardModel _$DealerCardModelFromJson(Map<String, dynamic> json) =>
    DealerCardModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      carCount: json['car_count'] as int? ?? 0,
      district: json['district'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      address: json['address'] as String? ?? '',
      isWorkingAllDays: json['is_working_all_days'] as bool? ?? false,
      workingDays: (json['working_days'] as List<dynamic>?)
              ?.map((e) => WorkingDaysModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DealerCardModelToJson(DealerCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'phone_number': instance.phoneNumber,
      'avatar': instance.avatar,
      'contact_from': instance.contactFrom,
      'contact_to': instance.contactTo,
      'location_url': instance.locationUrl,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'car_count': instance.carCount,
      'district': const RegionConverter().toJson(instance.district),
      'is_working_all_days': instance.isWorkingAllDays,
      'working_days': instance.workingDays,
    };

WorkingDaysModel _$WorkingDaysModelFromJson(Map<String, dynamic> json) =>
    WorkingDaysModel(
      dayOfWeek: json['day_of_week'] as String? ?? '',
    );

Map<String, dynamic> _$WorkingDaysModelToJson(WorkingDaysModel instance) =>
    <String, dynamic>{
      'day_of_week': instance.dayOfWeek,
    };
