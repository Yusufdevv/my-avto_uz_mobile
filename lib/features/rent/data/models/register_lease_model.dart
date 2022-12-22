import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_lease_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterLeaseModel extends RegisterLeaseEntity {
  const RegisterLeaseModel({
    required super.additionalServices,
    required super.endDate,
    required super.endLatitude,
    required super.endLongitude,
    required super.phoneNumber,
    required super.rent,
    required super.startDate,
    required super.startLatitude,
    required super.startLongitude,
    required super.userName,
  });
  factory RegisterLeaseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterLeaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterLeaseModelToJson(this);
}
