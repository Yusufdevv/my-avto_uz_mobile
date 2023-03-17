import 'package:auto/features/profile/domain/entities/car_product.dart';
import 'package:auto/features/profile/domain/entities/product_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_product.g.dart';

@JsonSerializable()
class CarProductModel extends CarProductEntity {
  const CarProductModel(
      {required super.category,
      required super.name,
      required super.image,
      required super.price,
      required super.count,
      required super.carPlace,
      required super.isAgreedPrice,
      required super.isPopular});

  factory CarProductModel.fromJson(Map<String, dynamic> json) =>
      _$CarProductModelFromJson(json);
}
