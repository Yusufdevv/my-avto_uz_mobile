import 'package:auto/features/reviews/data/models/model_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ModelEntity {
  const ModelEntity({
    this.id = 0,
    this.name = '',
    this.make = 0,
  });

  final int id;
  final String name;
  final int make;
}

class ModelConverter
    implements JsonConverter<ModelEntity, Map<String, dynamic>?> {
  const ModelConverter();

  @override
  ModelEntity fromJson(Map<String, dynamic>? json) =>
      ModelModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ModelEntity object) => {};
}
