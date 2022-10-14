import 'package:auto/features/rent/domain/entities/rent_car_make_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_make_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarMakeModel extends RentCarMakeEntity {
  const RentCarMakeModel({
    required super.id,
    required super.name,
    required super.logo,
  });

  factory RentCarMakeModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarMakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarMakeModelToJson(this);
}
