import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/dealers/data/models/cars_in_marks_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_single_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarsInMarksEntity extends Equatable {
  final int id;
  final int viewsCount;
  final String createdAt;
  final String updatedAt;
  final String moderationStatus;
  final List<String> gallery;
  final int year;
  @CarUserConverter()
  final CarUserEntity user;
  final String absoluteCarName;
  final String licenceType;
  final String ownership;
  final String purchaseDate;
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
  final double longitude;
  final double latitude;
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
  @CarMakeConverter()
  final CarMakeEntity make;
  @CarModelConverter()
  final CarModelEntity model;
  final int generation;
  final int bodyType;
  final int driveType;
  final int engineType;
  final int gearboxType;
  final int modificationType;
  @RegionConverter()
  final RegionEntity region;
  final int district;
  @DealerCardConvert()
  final DealerSingleEntity dealer;
  final bool isWishlisted;
  final bool isComparison;
  final bool isRentWithPurchase;

  const CarsInMarksEntity({
    this.id = 0,
    this.viewsCount = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.moderationStatus = '',
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
    this.isRentWithPurchase = false,
    this.price = '',
    this.discount = '',
    this.currency = '',
    this.publishedAt = '',
    this.contactViewsCount = 0,
    this.expiredAt = '',
    this.make = const CarMakeEntity(),
    this.model = const CarModelEntity(),
    this.generation = 0,
    this.bodyType = 0,
    this.driveType = 0,
    this.engineType = 0,
    this.gearboxType = 0,
    this.modificationType = 0,
    this.region = const RegionEntity(),
    this.district = 0,
    this.user = const CarUserEntity(),
    this.dealer = const DealerSingleEntity(),
    this.isWishlisted = false,
    this.isComparison = false,
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
        isRentWithPurchase,
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
        isWishlisted,
        isComparison
      ];
}

class CarsInDealerEntityConverter
    implements JsonConverter<CarsInMarksEntity, Map<String, dynamic>?> {
  const CarsInDealerEntityConverter();

  @override
  CarsInMarksEntity fromJson(Map<String, dynamic>? json) =>
      CarsInMarksModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarsInMarksEntity object) => {};
}
