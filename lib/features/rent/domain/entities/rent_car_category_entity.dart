import 'package:auto/features/rent/data/models/rent_car_category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarCategoryEntity extends Equatable {
  final int id;
  final String name;

  const RentCarCategoryEntity({
    this.id = 0,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class RentCarCategoryConverter
    implements JsonConverter<RentCarCategoryEntity, Map<String, dynamic>?> {
  const RentCarCategoryConverter();

  @override
  RentCarCategoryEntity fromJson(Map<String, dynamic>? json) =>
      RentCarCategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarCategoryEntity object) => {};
}
