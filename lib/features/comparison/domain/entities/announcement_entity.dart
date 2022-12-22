import 'package:auto/features/comparison/data/models/announcement_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AnnouncementsEntity extends Equatable {
  const AnnouncementsEntity({
    this.id = 0,
    this.licenceType = '',
    this.ownership = '',
    this.isRegisteredLocally = true,
    this.isNew = true,
    this.price = '',
    this.currency = '',
    this.make = '',
    this.model = '',
    this.generation = '',
    this.bodyType = '',
    this.driveType = '',
    this.engineType = '',
    this.gearboxType = '',
    this.year = 2002,
    this.color = '',
    this.power = '',
    this.volume = '',
  });

  final int id;
  final String licenceType;
  final String ownership;
  final bool isRegisteredLocally;
  final bool isNew;
  final String price;
  final String currency;
  final String make;
  final String model;
  final String generation;
  final String bodyType;
  final String driveType;
  final String engineType;
  final String gearboxType;
  final int year;
  final String color;
  final String power;
  final String volume;

  @override
  List<Object?> get props => [
    id,
    licenceType,
    ownership,
    isRegisteredLocally,
    isNew,
    price,
    currency,
    make,
    model,
    generation,
    bodyType,
    driveType,
    engineType,
    gearboxType,
    year,
    color,
    power,
    volume,
  ];
}

class AnnouncementsConverter
    implements JsonConverter<AnnouncementsEntity, Map<String, dynamic>?> {
  const AnnouncementsConverter();
  @override
  AnnouncementsEntity fromJson(Map<String, dynamic>? json) =>
      AnnouncementsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AnnouncementsEntity object) => {};
}