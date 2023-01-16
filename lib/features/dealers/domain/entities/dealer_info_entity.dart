import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_type_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DealerSingleEntity extends Equatable {
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
  @DealerTypeConverter()
  final DealerTypeEntity dealerType;
  final List<String> gallery;

  const DealerSingleEntity({
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
    this.gallery = const [],
    this.dealerType = const DealerTypeEntity(),
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
        dealerType,
      ];
}

class DealerCardConvert
    implements JsonConverter<DealerSingleEntity, Map<String, dynamic>?> {
  const DealerCardConvert();

  @override
  DealerSingleEntity fromJson(Map<String, dynamic>? json) =>
      DealerSingleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DealerSingleEntity object) => {};
}
