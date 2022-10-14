import 'package:auto/features/rent/domain/entities/rent_car_modification_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_modification_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarModificationModel extends RentCarModificationEntity {
  const RentCarModificationModel({
    required super.id,
    required super.power,
    required super.volume,
  });
  factory RentCarModificationModel.fromJson(Map<String,dynamic>json) => _$RentCarModificationModelFromJson(json);

  Map<String,dynamic> toJson() => _$RentCarModificationModelToJson(this);

}
