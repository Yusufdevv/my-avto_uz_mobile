// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarProductModel _$CarProductModelFromJson(Map<String, dynamic> json) =>
    CarProductModel(
      category: const ProductCategoryConverter()
          .fromJson(json['category'] as Map<String, dynamic>?),
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '',
      count: json['count'] as int? ?? 0,
      carPlace: json['car_place'] as int? ?? 0,
      isAgreedPrice: json['is_agreed_price'] as bool? ?? false,
      isPopular: json['is_popular'] as bool? ?? false,
    );

Map<String, dynamic> _$CarProductModelToJson(CarProductModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'name': instance.name,
      'car_place': instance.carPlace,
      'category': const ProductCategoryConverter().toJson(instance.category),
      'price': instance.price,
      'image': instance.image,
      'is_agreed_price': instance.isAgreedPrice,
      'is_popular': instance.isPopular,
    };
