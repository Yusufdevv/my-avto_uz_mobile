import 'package:auto/features/common/domain/model/type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class TypeEntity extends Equatable {
  const TypeEntity({
    this.id = -1,
    this.type = '',
    this.logo = '',
  });

  final int id;
  final String type;
  final String logo;

  @override
  List<Object?> get props => [id, type, logo];
}

class TypeConverter
    implements JsonConverter<TypeEntity, Map<String, dynamic>?> {
  const TypeConverter();

  @override
  TypeEntity fromJson(Map<String, dynamic>? json) =>
      TypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(TypeEntity object) =>
      TypeModel(id: object.id, logo: object.logo, type: object.type).toJson();
}
