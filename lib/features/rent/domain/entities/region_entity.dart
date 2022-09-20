import 'package:auto/features/rent/data/models/region_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RegionEntity extends Equatable {
  final int id;
  final String title;

  const RegionEntity({
    this.id = 0,
    this.title = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
      ];
}

class RegionConverter
    implements JsonConverter<RegionEntity, Map<String, dynamic>?> {
  const RegionConverter();

  @override
  RegionEntity fromJson(Map<String, dynamic>? json) =>
      RegionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RegionEntity object) => {};
}
