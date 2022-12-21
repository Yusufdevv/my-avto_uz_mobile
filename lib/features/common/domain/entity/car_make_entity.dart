import 'package:auto/features/common/domain/model/car_make_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarMakeEntity extends Equatable {
  const CarMakeEntity(
      {this.id = -1, this.name = '', this.slug = '', this.logo = ''});

  final int id;
  final String name;
  final String slug;
  final String logo;
  @override
  List<Object?> get props => [id, name, slug, logo];
}

class CarMakeConverter
    implements JsonConverter<CarMakeEntity, Map<String, dynamic>?> {
  const CarMakeConverter();

  @override
  CarMakeEntity fromJson(Map<String, dynamic>? json) =>
      CarMakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarMakeEntity object) =>
      CarMakeModel(id: object.id, logo: object.logo, name: object.name)
          .toJson();
}
