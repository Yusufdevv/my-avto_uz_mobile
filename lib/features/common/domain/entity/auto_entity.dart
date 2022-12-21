import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AutoEntity extends Equatable {
  const AutoEntity({
    this.id = -1,
    this.carMake = const CarMakeEntity(),
    this.carModel = const CarModelEntity(),
    this.carGeneration = const CarGenerationEntity(),
    this.carBodyType = const TypeEntity(),
    this.carDriveType = const TypeEntity(),
    this.carEngineType = const TypeEntity(),
    this.carGearboxType = const TypeEntity(),
    this.carModificationType = const CarModificationTypeEntity(),
    this.contactEmail = '',
    this.contactName = '',
    this.contactPhone = '',
    this.currency = '',
    this.gallery = const [],
    this.price = 0,
    this.userType = '',
    this.registeredInUzbekistan = false,
    this.carYear = 0,
    this.dealer,
    this.description = '',
    this.distanceTraveled = 0,
    this.district = const CarDistrictEntity(),
    this.isNew = false,
    this.isRegisteredLocally = false,
    this.isWishlisted = false,
    this.latitude = '',
    this.licenceType = '',
    this.longitude = '',
    this.ownership = '',
    this.publishedAt = '',
    this.region = const CarDistrictEntity(),
    this.carUser = const CarUserEntity(),
    this.viewsCount = 0,
  });

  final int id;
  @CarMakeConverter()
  final CarMakeEntity carMake;
  @CarModelConverter()
  final CarModelEntity carModel;
  @CarGenerationConverter()
  final CarGenerationEntity carGeneration;
  @TypeConverter()
  final TypeEntity carBodyType;
  @TypeConverter()
  final TypeEntity carDriveType;
  @TypeConverter()
  final TypeEntity carEngineType;
  @TypeConverter()
  final TypeEntity carGearboxType;
  final int carYear;
  @CarModificationTypeConverter()
  final CarModificationTypeEntity carModificationType;
  @CarDistrictConverter()
  final CarDistrictEntity region;
  @CarDistrictConverter()
  final CarDistrictEntity district;
  @CarUserConverter()
  final CarUserEntity carUser;
  final dynamic dealer;
  final String licenceType;
  final String ownership;
  final String description;
  final bool isRegisteredLocally;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final String longitude;
  final String latitude;
  final int distanceTraveled;
  final bool registeredInUzbekistan;
  final String userType;
  final bool isNew;
  final double price;
  final String currency;
  final List<String> gallery;
  final String publishedAt;
  final int viewsCount;
  final bool isWishlisted;
  @override
  List<Object?> get props => [
        id,
        carMake,
        carModel,
        carGeneration,
        carBodyType,
        carDriveType,
        carEngineType,
        carGearboxType,
        carYear,
        carModificationType,
        region,
        district,
        carUser,
        dealer,
        licenceType,
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
        carBodyType: object.carBodyType,
        carDriveType: object.carDriveType,
        carEngineType: object.carEngineType,
        carGearboxType: object.carGearboxType,
        carGeneration: object.carGeneration,
        carMake: object.carMake,
        carModel: object.carModel,
        carModificationType: object.carModificationType,
        carYear: object.carYear,
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
        carUser: object.carUser,
        userType: object.userType,
        viewsCount: object.viewsCount,
      ).toJson();
}
