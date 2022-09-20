import 'package:auto/features/rent/domain/entities/rent_car_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarCategoryModel extends RentCarCategoryEntity {
  const RentCarCategoryModel({
    required super.id,
    required super.name,
  });

  factory RentCarCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarCategoryModelToJson(this);
}
