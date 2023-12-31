import 'package:auto/features/common/domain/model/car_district_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarDistrictEntity extends Equatable {
  const CarDistrictEntity({this.id = -1, this.title = ''});

  final int id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}

class CarDistrictConverter
    implements JsonConverter<CarDistrictEntity, Map<String, dynamic>?> {
  const CarDistrictConverter();

  @override
  CarDistrictEntity fromJson(Map<String, dynamic>? json) =>
      CarDistrictModel.fromJson(json ?? {});
  @override
  Map<String, dynamic>? toJson(CarDistrictEntity object) =>
      CarDistrictModel(id: object.id, title: object.title).toJson();
}
