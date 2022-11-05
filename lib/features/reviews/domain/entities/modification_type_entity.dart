import 'package:auto/features/reviews/data/models/modification_type_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ModificationTypeEntity {
  const ModificationTypeEntity({
    this.id = 0,
    this.power = '',
    this.volume = '',
  });

  final int id;
  final String power;
  final String volume;
}

class ModificationTypeConverter
    implements JsonConverter<ModificationTypeEntity, Map<String, dynamic>?> {
  const ModificationTypeConverter();

  @override
  ModificationTypeEntity fromJson(Map<String, dynamic>? json) =>
      ModificationTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ModificationTypeEntity object) => {};
}
