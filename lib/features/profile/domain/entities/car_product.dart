import 'package:auto/features/profile/domain/entities/product_category.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CarProductEntity extends Equatable {
  @JsonKey(name: 'count', defaultValue: 0)
  final int count;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'car_place', defaultValue: 0)
  final int carPlace;
  @ProductCategoryConverter()
  final ProductCategoryEntity category;
  @JsonKey(name: 'price', defaultValue: '')
  final String price;
  @JsonKey(name: 'image', defaultValue: '')
  final String image;
  @JsonKey(name: 'is_agreed_price', defaultValue: false)
  final bool isAgreedPrice;
  @JsonKey(name: 'is_popular', defaultValue: false)
  final bool isPopular;

  const CarProductEntity({
    required this.category,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
    required this.carPlace,
    required this.isAgreedPrice,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        category,
        name,
        image,
        price,
        count,
        carPlace,
        isAgreedPrice,
        isPopular,
      ];
}
