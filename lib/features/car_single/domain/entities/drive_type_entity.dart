import 'package:auto/features/car_single/data/model/drive_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarDriveTypeEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String? logo;

  const RentCarDriveTypeEntity({
    this.id = 0,
    this.type = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class RentCarDriveTypeConverter<S>
    implements JsonConverter<RentCarDriveTypeEntity, Map<String, dynamic>?> {
  const RentCarDriveTypeConverter();

  @override
  RentCarDriveTypeEntity fromJson(Map<String, dynamic>? json) =>
      RentCarDriveTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarDriveTypeEntity object) => {};
}
