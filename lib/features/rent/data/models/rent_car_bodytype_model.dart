import 'package:auto/features/rent/domain/entities/rent_car_bodytype_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_bodytype_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarBodyTypeModel extends RentCarBodyTypeEntity {
  const RentCarBodyTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });
  factory RentCarBodyTypeModel.fromJson(Map<String,dynamic>json) => _$RentCarBodyTypeModelFromJson(json);

  Map<String,dynamic> toJson() => _$RentCarBodyTypeModelToJson(this);

}
