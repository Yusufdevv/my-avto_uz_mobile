import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_filter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementFilterModel extends Equatable {
  final int? make;
  final int? model;
  final bool? isNew;
  final int? bodyType;
  final int? gearboxType;
  final int? driveType;
  final int? priceFrom;
  final int? priceTo;
  final int? yearFrom;
  final int? yearTo;
  final String? region__in;

  const AnnouncementFilterModel({
    this.make,
    this.model,
    this.isNew,
    this.bodyType,
    this.gearboxType,
    this.driveType,
    this.priceFrom,
    this.priceTo,
    this.yearFrom,
    this.yearTo,
    this.region__in,
  });

  AnnouncementFilterModel copyWith({
    int? make,
    int? model,
    bool? isNew,
    int? bodyType,
    int? gearboxType,
    int? driveType,
    int? priceFrom,
    int? priceTo,
    int? yearFrom,
    int? yearTo,
    String? region__in,
  }) =>
      AnnouncementFilterModel(
        make: make ?? this.make,
        model: model ?? this.model,
        isNew: isNew,
        bodyType: bodyType ?? this.bodyType,
        gearboxType: gearboxType ?? this.gearboxType,
        driveType: driveType ?? this.driveType,
        priceFrom: priceFrom ?? this.priceFrom,
        priceTo: priceTo ?? this.priceTo,
        yearFrom: yearFrom ?? this.yearFrom,
        yearTo: yearTo ?? this.yearTo,
        region__in: region__in ?? this.region__in,
      );
  factory AnnouncementFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementFilterModelToJson(this);
  @override
  List<Object?> get props => [
        make,
        model,
        isNew,
        bodyType,
        gearboxType,
        driveType,
        region__in,
        priceFrom,
        priceTo,
        yearFrom,
        yearTo
      ];
}
