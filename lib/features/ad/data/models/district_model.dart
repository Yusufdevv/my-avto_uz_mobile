import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
part 'district_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DistrictModel extends DistrictEntity {
  const DistrictModel({
    required super.id,
    required super.title,
    required super.region,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
