import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IdNameModel extends IdNameEntity {
  const IdNameModel({
    required super.id,
    required super.name,
  });

  factory IdNameModel.fromJson(Map<String, dynamic> json) =>
      _$IdNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdNameModelToJson(this);
}
