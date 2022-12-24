import 'package:auto/features/ad/domain/entities/car_model/car_model_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarModel extends CarModelEntity {
  const CarModel({
    required super.id,
    required super.name,
    required super.make,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
