import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:auto/features/dealers/data/models/map_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class MapEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String phoneNumber;
  final String avatar;
  final String contactFrom;
  final String contactTo;
  final String locationUrl;
  final double longitude;
  final double latitude;
  final int carCount;
  final String iconPath;

  @IdNameConverter()
  final IdNameEntity dealerType;
  final dynamic category;
  @RegionConverter()
  final RegionEntity district;
  final List<String> gallery;

  MapEntity iconize({
    String? iconPath,
  }) =>
      MapEntity(
        id: id,
        dealerType: dealerType,
        name: name,
        iconPath: iconPath ?? this.iconPath,
        slug: slug,
        description: description,
        phoneNumber: phoneNumber,
        avatar: avatar,
        contactFrom: contactFrom,
        contactTo: contactTo,
        locationUrl: locationUrl,
        longitude: longitude,
        latitude: latitude,
        carCount: carCount,
        district: district,
        gallery: gallery,
        category: category,
      );

  const MapEntity({
    this.dealerType = const IdNameEntity(),
    this.iconPath = '',
    this.id = -1,
    this.name = '',
    this.slug = '',
    this.description = '',
    this.phoneNumber = '',
    this.avatar = '',
    this.contactFrom = '',
    this.contactTo = '',
    this.locationUrl = '',
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.carCount = 0,
    this.category,
    this.district = const RegionEntity(),
    this.gallery = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        phoneNumber,
        avatar,
        contactFrom,
        contactTo,
        locationUrl,
        longitude,
        latitude,
        carCount,
        district,
        gallery,
        category,
      ];
}

class DealerCardConvert
    implements JsonConverter<MapEntity, Map<String, dynamic>?> {
  const DealerCardConvert();

  @override
  MapEntity fromJson(Map<String, dynamic>? json) =>
      MapModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(MapEntity object) => {};
}
