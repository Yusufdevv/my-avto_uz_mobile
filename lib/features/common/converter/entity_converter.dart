import 'package:json_annotation/json_annotation.dart';

class EntityConverter<Entity>
    implements JsonConverter<Entity, Map<String, dynamic>?> {
  final Entity Function(Map<String, dynamic>)? fromJsonModel;
  const EntityConverter({this.fromJsonModel});

  @override
  Entity fromJson(Map<String, dynamic>? json) => fromJsonModel!(json ?? {});

  @override
  Map<String, dynamic> toJson(Entity object) => {};
}

// class RegionConverter
//     implements JsonConverter<RegionEntity, Map<String, dynamic>?> {
//   const RegionConverter();
//
//   @override
//   RegionEntity fromJson(Map<String, dynamic>? json) =>
//       RegionModel.fromJson(json ?? {});
//
//   @override
//   Map<String, dynamic> toJson(RegionEntity object) => {};
// }
