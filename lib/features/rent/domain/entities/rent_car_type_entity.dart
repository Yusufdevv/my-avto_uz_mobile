import 'package:auto/features/rent/data/models/rent_car_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarTypeEntity extends Equatable {
  final int id;
  final String name;

  const RentCarTypeEntity({
    this.id = 0,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class RentCarTypeConverter
    implements JsonConverter<RentCarTypeEntity, Map<String, dynamic>?> {
  const RentCarTypeConverter();

  @override
  RentCarTypeEntity fromJson(Map<String, dynamic>? json) =>
      RentCarTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarTypeEntity object) => {};
}
