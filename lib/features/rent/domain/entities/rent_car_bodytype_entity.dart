import 'package:auto/features/rent/data/models/rent_car_bodytype_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarBodyTypeEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String? logo;

  const RentCarBodyTypeEntity({
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

class RentCarBodyTypeConverter<S>
    implements JsonConverter<RentCarBodyTypeEntity, Map<String, dynamic>?> {
  const RentCarBodyTypeConverter();

  @override
  RentCarBodyTypeEntity fromJson(Map<String, dynamic>? json) =>
      RentCarBodyTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarBodyTypeEntity object) => {};
}
