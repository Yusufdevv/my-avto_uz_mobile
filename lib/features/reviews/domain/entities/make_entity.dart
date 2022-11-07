import 'package:auto/features/reviews/data/models/make_model.dart';
import 'package:json_annotation/json_annotation.dart';

class MakeEntity {
  const MakeEntity({
    this.id = 0,
    this.name = '',
    this.logo = '',
  });

  final int id;
  final String name;
  final String logo;
}

class MakeConverter
    implements JsonConverter<MakeEntity, Map<String, dynamic>?> {
  const MakeConverter();

  @override
  MakeEntity fromJson(Map<String, dynamic>? json) =>
      MakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(MakeEntity object) => {};
}
