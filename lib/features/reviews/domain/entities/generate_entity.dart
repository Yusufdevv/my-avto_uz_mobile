import 'package:auto/features/reviews/data/models/generate_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GenerateEntity {
  const GenerateEntity({
    this.id = 0,
    this.name = '',
    this.yearBegin = 0,
    this.yearEnd = 0,
    this.model = 0,
    this.logo = '',
  });

  final int id;
  final String name;
  final int yearBegin;
  final int yearEnd;
  final int model;
  final String logo;
}

class GenerateConverter
    implements JsonConverter<GenerateEntity, Map<String, dynamic>?> {
  const GenerateConverter();

  @override
  GenerateEntity fromJson(Map<String, dynamic>? json) =>
      GenerateModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(GenerateEntity object) => {};
}
