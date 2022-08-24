// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel(
      id: json['id'] as int? ?? '',
      carModel: NamingModel.fromJson(json['car_model'] as Map<String, dynamic>),
      carMake: CarMake.fromJson(json['car_make'] as Map<String, dynamic>),
      currency: json['currency'] as int? ?? '',
      price: json['price'] as int? ?? '',
      description: json['description '] as String? ?? '',
      carYear: json['car_year'] as int? ?? '',
      contactEmail: json['contact_email'] as String? ?? '',
      contactName: json['contact_name'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      isNew: json['is_new'] as bool? ?? '',
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? '',
      licenseType: json['licence_type'] as String? ?? '',
      ownerShip: json['ownership'] as String? ?? '',
      publishedAt: json['published_at'] as int? ?? '',
      userType: json['user_type'] as bool? ?? '',
    );

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car_year': instance.carYear,
      'licence_type': instance.licenseType,
      'ownership': instance.ownerShip,
      'description ': instance.description,
      'contact_name': instance.contactName,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'is_registered_locally': instance.isRegisteredLocally,
      'user_type': instance.userType,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
      'published_at': instance.publishedAt,
      'car_make': instance.carMake,
      'car_model': instance.carModel,
    };
