import 'package:auto/features/comparison/domain/entities/announcement_entity.dart';
import 'package:auto/features/comparison/domain/entities/engine_data_entity.dart';
import 'package:auto/features/comparison/domain/entities/main_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementsModel extends AnnouncementsEntity {
  const AnnouncementsModel({
    required super.id,
    required super.licenceType,
    required super.ownership,
    required super.isRegisteredLocally,
    required super.isNew,
    required super.price,
    required super.currency,
    required super.dimensions,
    required super.engineData,
    required super.mainData,
    required super.other,
    required super.suspensionsAndBrakes,
    required super.volumeAndMass,
  });

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementsModelToJson(this);
}
