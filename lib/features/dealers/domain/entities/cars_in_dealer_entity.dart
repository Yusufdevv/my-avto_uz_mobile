import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CarsInDealerEntity extends Equatable {
  final int id;
  final int viewsCount;
  final String createdAt;
  final String updatedAt;
  final String moderationStatus;
  final List<String> gallery;
  final int year;
  final String absoluteCarName;
  final String licenceType;
  final String ownership;
  final String  purchaseDate;
  final String description;
  final String descriptionUz;
  final String descriptionRu;
  final bool isRegisteredLocally;
  final String color;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final String contactAvailableFrom;
  final String contactAvailableTo;
  final String locationUrl;
  final int longitude;
  final int latitude;
  final int distanceTraveled;
  final String mileageImage;
  final String registrationVin;
  final String registrationPlate;
  final String registrationCertificate;
  final String registrationSerialNumber;
  final bool registeredInUzbekistan;
  final String userType;
  final bool isNew;
  final String price;
  final String discount;
  final String currency;
  final String publishedAt;
  final int contactViewsCount;
  final String expiredAt;
  final int make;
  final int model;
  final int generation;
  final int bodyType;
  final int driveType;
  final int engineType;
  final int gearboxType;
  final int modificationType;
  @RegionConverter()
  final RegionEntity region;
  final int district;
  final int user;
  final int dealer;

  const CarsInDealerEntity({
    this.id = 0,
    this.viewsCount = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.moderationStatus ='',
    this.gallery = const [],
    this.year = 0,
    this.absoluteCarName = '',
    this.licenceType = '',
    this.ownership = '',
    this.purchaseDate = '',
    this.description = '',
    this.descriptionUz = '',
    this.descriptionRu = '',
    this.isRegisteredLocally = false,
    this.color = '',
    this.contactName = '',
    this.contactEmail = '',
    this.contactPhone = '',
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
    this.locationUrl = '',
    this.longitude = 0,
    this.latitude = 0,
    this.distanceTraveled = 0,
    this.mileageImage = '',
    this.registrationVin = '',
    this.registrationPlate = '',
    this.registrationCertificate = '',
    this.registrationSerialNumber = '',
    this.registeredInUzbekistan = false,
    this.userType = '',
    this.isNew = false,
    this.price = '',
    this.discount = '',
    this.currency = '',
    this.publishedAt = '',
    this.contactViewsCount = 0,
    this.expiredAt = '',
    this.make = 0,
    this.model = 0,
    this.generation = 0,
    this.bodyType = 0,
    this.driveType = 0,
    this.engineType = 0,
    this.gearboxType = 0,
    this.modificationType = 0,
    this.region = const RegionEntity(),
    this.district = 0,
    this.user = 0,
    this.dealer = 0,
  });

  @override
  List<Object?> get props => [
    id,
    viewsCount,
    createdAt,
    updatedAt,
    moderationStatus,
    gallery,
    year,
    absoluteCarName,
    licenceType,
    ownership,
    purchaseDate,
    description,
    descriptionUz,
    descriptionRu,
    isRegisteredLocally,
    color,
    contactName,
    contactEmail,
    contactPhone,
    contactAvailableFrom,
    contactAvailableTo,
    locationUrl,
    longitude,
    latitude,
    distanceTraveled,
    mileageImage,
    registrationVin,
    registrationPlate,
    registrationCertificate,
    registrationSerialNumber,
    registeredInUzbekistan,
    userType,
    isNew,
    price,
    discount,
    currency,
    publishedAt,
    contactViewsCount,
    expiredAt,
    make,
    model,
    generation,
    bodyType,
    driveType,
    engineType,
    gearboxType,
    modificationType,
    region,
    district,
    user,
    dealer,
  ];
}

class CarsInDealerEntityConverter
    implements JsonConverter<CarsInDealerEntity, Map<String, dynamic>?> {
  const CarsInDealerEntityConverter();

  @override
  CarsInDealerEntity fromJson(Map<String, dynamic>? json) =>
      CarsInDealerModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarsInDealerEntity object) => {};
}
