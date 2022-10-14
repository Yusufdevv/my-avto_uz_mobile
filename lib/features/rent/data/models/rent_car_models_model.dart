import 'package:auto/features/rent/domain/entities/rent_car_models_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_models_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarModelsModel extends RentCarModelsEntity {
  const RentCarModelsModel({
    required super.id,
    required super.name,
    required super.make,
  });
  factory RentCarModelsModel.fromJson(Map<String,dynamic>json) => _$RentCarModelsModelFromJson(json);

  Map<String,dynamic> toJson() => _$RentCarModelsModelToJson(this);

}
