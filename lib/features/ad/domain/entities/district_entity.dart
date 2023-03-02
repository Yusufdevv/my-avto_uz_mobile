import 'package:auto/features/ad/data/models/district_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DistrictEntity extends Equatable {
  final int id;
  final String title;
  @RegionConverter()
  final RegionEntity region;

  const DistrictEntity({
    this.id = -1,
    this.region = const RegionEntity(),
    this.title = '',
  });

  @override
  List<Object?> get props => [
        id,
        title,
        region,
      ];
}

class DistrictConverter
    extends JsonConverter<DistrictEntity, Map<String, dynamic>?> {
  const DistrictConverter();

  @override
  DistrictEntity fromJson(Map<String, dynamic>? json) =>
      DistrictModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DistrictEntity object) => DistrictModel(
        id: object.id,
        region: object.region,
        title: object.title,
      ).toJson();
}
