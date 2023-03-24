import 'package:auto/features/profile/domain/entities/product_category.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductsList extends Equatable {
  final int id;
  final String name;
  final int carPlace;
  @ProductCategoryConverter()
  final ProductCategoryEntity category;
  final String? price;
  final String? image;
  final bool isAgreedPrice;
  final bool isPopular;

  ProductsList({
    this.category = const ProductCategoryEntity(),
    this.id = 0,
    this.name = '',
    this.image = '',
    this.price = '',
    this.carPlace = 0,
    this.isAgreedPrice = false,
    this.isPopular = false,
  });

  @override
  List<Object?> get props =>
      [id, name, image, category, price, carPlace, isAgreedPrice, isPopular];

  factory ProductsList.fromJson(Map<String, dynamic> json) =>
      _$ProductsListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListToJson(this);
}
