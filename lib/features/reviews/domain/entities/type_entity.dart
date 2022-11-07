import 'package:auto/features/reviews/data/models/type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TypeEntity {
  const TypeEntity({
    this.id = 0,
    this.type = '',
    this.logo = '',
  });

  final int id;
  final String type;
  final String logo;
}

class TypeConverter
    implements JsonConverter<TypeEntity, Map<String, dynamic>?> {
  const TypeConverter();

  @override
  TypeEntity fromJson(Map<String, dynamic>? json) =>
      TypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(TypeEntity object) => {};
}
