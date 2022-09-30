import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

part 'rent_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentListModel extends RentListEntity {
  const RentListModel({
    required super.id,
    required super.minDrivingExperience,
    required super.minAge,
    required super.price,
    required super.region,
    required super.rentCar,
  });

  factory RentListModel.fromJson(Map<String, dynamic> json) =>
      _$RentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentListModelToJson(this);
}
