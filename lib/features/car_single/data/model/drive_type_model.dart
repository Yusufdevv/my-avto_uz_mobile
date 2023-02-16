import 'package:auto/features/car_single/domain/entities/drive_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drive_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarDriveTypeModel extends RentCarDriveTypeEntity {
  const RentCarDriveTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });
  factory RentCarDriveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarDriveTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarDriveTypeModelToJson(this);
}
