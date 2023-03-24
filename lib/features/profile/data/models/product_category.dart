import 'package:auto/features/profile/domain/entities/product_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCategoryModel extends ProductCategory {
  const ProductCategoryModel({
    required super.id,
    required super.name,
    required super.productsCount,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
}
