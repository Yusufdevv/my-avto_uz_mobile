import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/stats_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore: must_be_immutable
class AutoEntity extends Equatable {
  AutoEntity({
    this.id = -1,
    this.make = const CarMakeEntity(),
    this.model = const CarModelEntity(),
    this.generation = const CarGenerationEntity(),
    this.bodyType = const TypeEntity(),
    this.driveType = const TypeEntity(),
    this.engineType = const TypeEntity(),
    this.gearboxType = const TypeEntity(),
    this.modificationType = const CarModificationTypeEntity(),
    this.contactEmail = '',
    this.contactName = '',
    this.contactPhone = '',
    this.currency = '',
    this.gallery = const [],
    this.price = 0,
    this.userType = '',
    this.registeredInUzbekistan = false,
    this.year = 0,
    this.dealer,
    this.description = '',
    this.distanceTraveled = 0,
    this.district = const CarDistrictEntity(),
    this.isNew = false,
    this.isRegisteredLocally = false,
    this.isWishlisted = false,
    this.latitude = 0,
    this.licenceType = '',
    this.moderationStatus = '',
    this.longitude = 0,
    this.ownership = '',
    this.publishedAt = '',
    this.region = const CarDistrictEntity(),
    this.user = const CarUserEntity(),
    this.viewsCount = 0,
    this.isComparison = false,
    this.discount = -1,
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
    this.absoluteCarName = '',
    this.color = '',
    this.purchaseDate = '',
    this.expiredAt = '',
    this.locationUrl = '',
    this.mileageImage = '',
    this.registrationVin = '',
    this.registrationPlate = '',
    this.registrationCertificate = '',
    this.registrationSerialNumber = '',
    this.isExpired = false,
    this.isRentWithPurchase = false,
    this.stats = const StatsEntity(),
  });

  final int id;
  @CarMakeConverter()
  final CarMakeEntity make;
  @CarModelConverter()
  final CarModelEntity model;
  @CarGenerationConverter()
  final CarGenerationEntity generation;
  @TypeConverter()
  final TypeEntity bodyType;
  @TypeConverter()
  final TypeEntity driveType;
  @TypeConverter()
  final TypeEntity engineType;
  @TypeConverter()
  final TypeEntity gearboxType;
  final int year;
  @CarModificationTypeConverter()
  final CarModificationTypeEntity modificationType;
  @CarDistrictConverter()
  final CarDistrictEntity region;
  @CarDistrictConverter()
  final CarDistrictEntity district;
  @StatsConverter()
  final StatsEntity stats;
  @CarUserConverter()
  final CarUserEntity user;
  final dynamic dealer;
  final String licenceType;
  final String moderationStatus;
  final String absoluteCarName;
  final String color;
  final String ownership;
  final String purchaseDate;
  final String description;
  final bool isRegisteredLocally;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final double longitude;
  final double latitude;
  final int distanceTraveled;
  final bool registeredInUzbekistan;
  final String userType;
  final bool isNew;
  final double price;
  final String currency;
  final List<String> gallery;
  final String publishedAt;
  final String expiredAt;
  final bool isExpired;
  final int viewsCount;
  bool isWishlisted;
  final bool isComparison;
  final bool isRentWithPurchase;
  final double discount;
  final String contactAvailableFrom;
  final String contactAvailableTo;
  final String locationUrl;
  final String mileageImage;
  final String registrationVin;
  final String registrationPlate;
  final String registrationCertificate;
  final String registrationSerialNumber;

  @override
  List<Object?> get props => [
        id,
        make,
        model,
        generation,
        bodyType,
        driveType,
        engineType,
        gearboxType,
        year,
        modificationType,
        region,
        district,
        expiredAt,
        isExpired,
        user,
        dealer,
        licenceType,
        moderationStatus,
        ownership,
        description,
        isRegisteredLocally,
        contactName,
        contactEmail,
        contactPhone,
        longitude,
        latitude,
        distanceTraveled,
        registeredInUzbekistan,
        userType,
        isNew,
        price,
        currency,
        gallery,
        publishedAt,
        viewsCount,
        isWishlisted,
        isComparison,
        absoluteCarName,
        color,
        locationUrl,
        mileageImage,
        purchaseDate,
        registrationCertificate,
        registrationPlate,
        registrationSerialNumber,
        registrationVin,
        stats,
        isRentWithPurchase
      ];
}

class AutoConverter
    implements JsonConverter<AutoEntity, Map<String, dynamic>?> {
  const AutoConverter();
  @override
  AutoEntity fromJson(Map<String, dynamic>? json) =>
      AutoModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AutoEntity object) => AutoModel(
        id: object.id,
        bodyType: object.bodyType,
        driveType: object.driveType,
        engineType: object.engineType,
        gearboxType: object.gearboxType,
        generation: object.generation,
        moderationStatus: object.moderationStatus,
        make: object.make,
        isExpired: object.isExpired,
        expiredAt: object.expiredAt,
        model: object.model,
        modificationType: object.modificationType,
        year: object.year,
        contactEmail: object.contactEmail,
        contactName: object.contactName,
        contactPhone: object.contactPhone,
        currency: object.currency,
        dealer: object.dealer,
        description: object.description,
        distanceTraveled: object.distanceTraveled,
        district: object.district,
        gallery: object.gallery,
        isNew: object.isNew,
        isRegisteredLocally: object.isRegisteredLocally,
        isWishlisted: object.isWishlisted,
        latitude: object.latitude,
        licenceType: object.licenceType,
        longitude: object.longitude,
        ownership: object.ownership,
        price: object.price,
        publishedAt: object.publishedAt,
        region: object.region,
        registeredInUzbekistan: object.registeredInUzbekistan,
        user: object.user,
        userType: object.userType,
        viewsCount: object.viewsCount,
        isComparison: object.isComparison,
        contactAvailableFrom: object.contactAvailableFrom,
        contactAvailableTo: object.contactAvailableTo,
        discount: object.discount,
        absoluteCarName: object.absoluteCarName,
        color: object.color,
        locationUrl: object.locationUrl,
        mileageImage: object.mileageImage,
        purchaseDate: object.purchaseDate,
        registrationCertificate: object.registrationCertificate,
        registrationPlate: object.registrationPlate,
        registrationSerialNumber: object.registrationSerialNumber,
        registrationVin: object.registrationVin,
        stats: object.stats,
        isRentWithPurchase :object.isRentWithPurchase,
      ).toJson();
}
