import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';

part 'rent_main_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentMainModel extends RentMainEntity {
  const RentMainModel({
    required super.id,
    required super.name,
    required super.rentList,
  });

  factory RentMainModel.fromJson(Map<String, dynamic> json) =>
      _$RentMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentMainModelToJson(this);
}
