import 'package:auto/features/comparison/domain/entities/main_data_entity.dart';
import 'package:auto/features/comparison/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainDataModel extends MainDataEntity {
  const MainDataModel({
    required super.bodyType,
    required super.color,
    required super.driveType,
    required super.gearboxType,
    required super.generation,
    required super.make,
    required super.model,
    required super.year,
    required super.contactAvailableFrom,
    required super.contactAvailableTo,
    required super.gallery,
    required super.user,
  });

  factory MainDataModel.fromJson(Map<String, dynamic> json) =>
      _$MainDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataModelToJson(this);
}
