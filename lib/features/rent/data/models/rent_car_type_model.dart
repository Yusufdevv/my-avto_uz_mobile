import 'package:auto/features/rent/domain/entities/rent_car_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarTypeModel extends RentCarTypeEntity {
  const RentCarTypeModel({
    required super.id,
    required super.name,
  });

  factory RentCarTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarTypeModelToJson(this);
}
