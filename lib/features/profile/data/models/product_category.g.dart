// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      productsCount: json['products_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products_count': instance.productsCount,
    };
