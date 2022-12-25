import 'package:auto/features/comparison/data/models/main_data_model.dart';
import 'package:auto/features/comparison/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class MainDataEntity extends Equatable {
  const MainDataEntity({
    this.make = '',
    this.model = '',
    this.generation = '',
    this.bodyType = '',
    this.driveType = '',
    this.gearboxType = '',
    this.year = 0,
    this.color = '',
    this.gallery = const [],
    this.user = const UserEntity(),
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
  });

  final String make;
  final String model;
  final String generation;
  final String bodyType;
  final String driveType;
  final String gearboxType;
  final int year;
  final String color;
  final List<String> gallery;
  @UserConverter()
  final UserEntity user;
  final String contactAvailableFrom;
  final String contactAvailableTo;

  @override
  List<Object?> get props => [
        make,
        model,
        generation,
        bodyType,
        driveType,
        gearboxType,
        year,
        color,
        gallery,
        user,
        contactAvailableFrom,
        contactAvailableTo,
      ];
}

class MainDataConverter
    implements JsonConverter<MainDataEntity, Map<String, dynamic>?> {
  const MainDataConverter();
  @override
  MainDataEntity fromJson(Map<String, dynamic>? json) =>
      MainDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(MainDataEntity object) => {};
}
