import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DealerCardEntity extends Equatable {
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
  @RegionConverter()
  final RegionEntity district;

  const DealerCardEntity({
    this.id = 0,
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
    this.district = const RegionEntity(),
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
      ];
}

class DealerCardConvert
    implements JsonConverter<DealerCardEntity, Map<String, dynamic>?> {
  const DealerCardConvert();

  @override
  DealerCardEntity fromJson(Map<String, dynamic>? json) =>
      DealerCardModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DealerCardEntity object) => {};
}
