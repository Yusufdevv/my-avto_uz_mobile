// ignore_for_file: constant_identifier_names

import 'package:auto/features/ad/domain/entities/damaged_part/damaged_part.dart';
import 'package:equatable/equatable.dart';

class AnnouncementToPostEntity extends Equatable {
  final int id;
  final int make;
  final int model;
  final int generation;
  final int bodyType;
  final int driveType;
  final int engineType;
  final int gearboxType;
  final int year;
  final int modificationType;
  final String licenceType;
  final String ownership;
  final String purchaseDate;
  final bool isRegisteredLocally;
  final String contactName;
  final String contactPhone;
  final int region;
  final String price;
  final String currency;
  final int distanceTraveled;
  final String registrationVin;
  final String registrationPlate;
  final String registrationCertificate;
  final String registrationSerialNumber;
  final bool registeredInUzbekistan;
  final List<String> gallery;
  @DamagedPartEntityConverter()
  final List<DamagedPartEntity> damagedParts;
  final int? district;
  final String? contactEmail;
  final String? locationUrl;
  final String? contactAvailableTo;
  final String? description;
  final String? contactAvailableFrom;
  final bool? isNew;
  final String? color;
  const AnnouncementToPostEntity({
    this.bodyType = -1,
    this.distanceTraveled = -1,
    this.driveType = -1,
    this.engineType = -1,
    this.gearboxType = -1,
    this.generation = -1,
    this.id = -1,
    this.make = -1,
    this.model = -1,
    this.modificationType = -1,
    this.region = -1,
    this.year = -1,
    this.contactName = '',
    this.contactPhone = '',
    this.currency = '',
    this.licenceType = '',
    this.ownership = '',
    this.price = '',
    this.purchaseDate = '',
    this.registrationCertificate = '',
    this.registrationPlate = '',
    this.registrationSerialNumber = '',
    this.registrationVin = '',
    this.gallery = const <String>[],
    this.registeredInUzbekistan = false,
    this.isRegisteredLocally = false,
    this.color,
    this.contactAvailableFrom,
    this.contactAvailableTo,
    this.contactEmail,
    this.description,
    this.district,
    this.isNew,
    this.locationUrl,
    this.damagedParts = const <DamagedPartEntity>[],
  });
  @override
  List<Object?> get props => [
        bodyType,
        color,
        contactAvailableFrom,
        contactAvailableTo,
        contactEmail,
        contactName,
        contactPhone,
        currency,
        damagedParts,
        description,
        distanceTraveled,
        district,
        driveType,
        engineType,
        gallery,
        gearboxType,
        generation,
        id,
        isNew,
        isRegisteredLocally,
        licenceType,
        locationUrl,
        make,
        model,
        modificationType,
        ownership,
        price,
        purchaseDate,
        region,
        registeredInUzbekistan,
        registrationCertificate,
        registrationPlate,
        registrationSerialNumber,
        registrationVin,
        year,
      ];
}
