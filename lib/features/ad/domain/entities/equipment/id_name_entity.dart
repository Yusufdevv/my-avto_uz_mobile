import 'package:auto/features/ad/data/models/equipment/equipment_category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class IdNameEntity extends Equatable {
  final int id;
  final String name;

  const IdNameEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [id, name];
}

class IdNameConverter
    implements JsonConverter<IdNameEntity, Map<String, dynamic>?> {
  const IdNameConverter();

  @override
  IdNameEntity fromJson(Map<String, dynamic>? json) =>
      IdNameModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(IdNameEntity object) => {};
}
