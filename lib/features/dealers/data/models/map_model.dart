import 'package:auto/features/dealers/domain/entities/map_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MapModel extends MapEntity {
  const MapModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.phoneNumber,
    required super.avatar,
    required super.contactFrom,
    required super.contactTo,
    required super.locationUrl,
    required super.longitude,
    required super.latitude,
    required super.carCount,
    required super.district,
    required super.gallery,
    required super.category,
  });

  factory MapModel.fromJson(Map<String, dynamic> json) =>
      _$MapModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapModelToJson(this);
}
