import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarUserModel extends CarUserEntity {
  const CarUserModel({
    required super.id,
    required super.phoneNumber,
    required super.fullName,
    required super.image,
  });
  factory CarUserModel.fromJson(Map<String, dynamic> json) => _$CarUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarUserModelToJson(this);
}
