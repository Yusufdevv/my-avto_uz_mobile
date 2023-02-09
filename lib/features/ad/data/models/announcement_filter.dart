// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class AnnouncementFilterModel extends Equatable {
  final int? make;
  final int? model;
  final int? bodyType;
  final int? gearboxType;
  final int? driveType;
  final int? priceFrom;
  final int? priceTo;
  final int? yearFrom;
  final int? yearTo;
  final String? regionIn;

  const AnnouncementFilterModel({
    this.make,
    this.model,
    this.bodyType,
    this.gearboxType,
    this.driveType,
    this.priceFrom,
    this.priceTo,
    this.yearFrom,
    this.yearTo,
    this.regionIn,
  });

  AnnouncementFilterModel copyWith({
    int? make,
    int? model,
    int? bodyType,
    int? gearboxType,
    int? driveType,
    int? priceFrom,
    int? priceTo,
    int? yearFrom,
    int? yearTo,
    String? regionIn,
  }) =>
      AnnouncementFilterModel(
        make: make ?? this.make,
        model:  model ?? this.model,
        bodyType: bodyType ?? this.bodyType,
        gearboxType: gearboxType ?? this.gearboxType,
        driveType: driveType ?? this.driveType,
        priceFrom: priceFrom ?? this.priceFrom,
        priceTo: priceTo ?? this.priceTo,
        yearFrom: yearFrom ?? this.yearFrom,
        yearTo: yearTo ?? this.yearTo,
        regionIn: regionIn ?? this.regionIn,
      );

  @override
  List<Object?> get props => [
        make,
        model,
        bodyType,
        gearboxType,
        driveType,
        regionIn,
        priceFrom,
        priceTo,
        yearFrom,
        yearTo
      ];
}
