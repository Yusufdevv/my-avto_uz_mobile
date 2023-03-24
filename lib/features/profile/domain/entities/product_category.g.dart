// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryEntity _$ProductCategoryEntityFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryEntity(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      productsCount: json['products_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductCategoryEntityToJson(
        ProductCategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products_count': instance.productsCount,
    };
