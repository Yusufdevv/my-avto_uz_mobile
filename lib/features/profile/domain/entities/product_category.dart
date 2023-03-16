import 'package:auto/features/profile/data/models/product_category.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProductCategory extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'product_count', defaultValue: 0)
  final int productCount;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.productCount,
  });

  @override
  List<Object?> get props => [id, name, productCount];
}

class ProductCategoryConverter
    implements JsonConverter<ProductCategory, Map<String, dynamic>?> {
  const ProductCategoryConverter();

  @override
  ProductCategory fromJson(Map<String, dynamic>? json) =>
      ProductCategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ProductCategory object) => {};
}
