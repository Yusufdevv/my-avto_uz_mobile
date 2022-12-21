import 'package:auto/features/common/domain/entity/car_dealer_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_district_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarDistrictModel extends CarDistrictEntity {
  const CarDistrictModel({required super.id, required super.title});
  factory CarDistrictModel.fromJson(Map<String, dynamic> json) =>
      _$CarDistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarDistrictModelToJson(this);
}
