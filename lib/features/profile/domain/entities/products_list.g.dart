// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsList _$ProductsListFromJson(Map<String, dynamic> json) => ProductsList(
      category: json['category'] == null
          ? const ProductCategoryEntity()
          : const ProductCategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: json['price'] as String? ?? '',
      carPlace: json['car_place'] as int? ?? 0,
      isAgreedPrice: json['is_agreed_price'] as bool? ?? false,
      isPopular: json['is_popular'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductsListToJson(ProductsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'car_place': instance.carPlace,
      'category': const ProductCategoryConverter().toJson(instance.category),
      'price': instance.price,
      'image': instance.image,
      'is_agreed_price': instance.isAgreedPrice,
      'is_popular': instance.isPopular,
    };
