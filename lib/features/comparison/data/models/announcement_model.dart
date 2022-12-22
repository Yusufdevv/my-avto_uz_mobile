import 'package:auto/features/comparison/domain/entities/announcement_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementsModel extends  AnnouncementsEntity{
  const AnnouncementsModel({
    required super.id,
    required super.licenceType,
    required super.ownership,
    required super.isRegisteredLocally,
    required super.isNew,
    required super.price,
    required super.currency,
    required super.make,
    required super.model,
    required super.generation,
    required super.bodyType,
    required super.driveType,
    required super.engineType,
    required super.gearboxType,
    required super.year,
    required super.color,
    required super.power,
    required super.volume,
  });

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementsModelToJson(this);
}
