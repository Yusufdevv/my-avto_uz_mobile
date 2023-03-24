import 'package:auto/features/profile/data/models/product_category.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCategoryEntity extends Equatable {
  final int id;
  final String name;
  final int productsCount;

  const ProductCategoryEntity({
    this.id = -1,
    this.name = '',
    this.productsCount = 0,
  });

  @override
  List<Object?> get props => [id, name, productsCount];
}

class ProductCategoryConverter
    implements JsonConverter<ProductCategoryEntity, Map<String, dynamic>?> {
  const ProductCategoryConverter();

  @override
  ProductCategoryEntity fromJson(Map<String, dynamic>? json) =>
      ProductCategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(ProductCategoryEntity object) => {};
}
