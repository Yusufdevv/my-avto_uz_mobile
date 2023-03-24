import 'package:auto/features/profile/data/models/product_category.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_category.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCategory extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'products_count', defaultValue: 0)
  final int productsCount;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.productsCount,
  });

  @override
  List<Object?> get props => [id, name, productsCount];





  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);

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
