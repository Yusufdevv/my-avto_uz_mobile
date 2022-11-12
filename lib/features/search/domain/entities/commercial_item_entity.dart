import 'package:auto/features/search/data/models/search_item_model.dart';
import 'package:auto/features/search/domain/entities/car_dealer_entity.dart';
import 'package:auto/features/search/domain/entities/car_district_entity.dart';
import 'package:auto/features/search/domain/entities/car_generation_entity.dart';
import 'package:auto/features/search/domain/entities/car_make_entity.dart';
import 'package:auto/features/search/domain/entities/car_model_entity.dart';
import 'package:auto/features/search/domain/entities/car_user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CommercialItemEntity extends Equatable {
  final int carYear;
  final String description;
  final List<String> gallery;
  final String publishedAt;
  final bool isNew;
  final int price;
  final String currency;
  final bool isWishlisted;
  final String userType;
  final String contactPhone;
  @CarDistrictConverter()
  final CarDistrictEntity district;
  @CarUserConverter()
  final CarUserEntity user;
  @CarModelConverter()
  final CarModelEntity carModel;
  @CarDealerConverter()
  final CarDealerEntity dealer;
  @CarGenerationConverter()
  final CarGenerationEntity carGeneration;
  @CarMakeConverter()
  final CarMakeEntity carMake;

  const CommercialItemEntity({
    required this.carYear,
    required this.gallery,
    required this.publishedAt,
    required this.isNew,
    required this.price,
    required this.currency,
    required this.isWishlisted,
    required this.userType,
    required this.description,
    required this.district,
    required this.user,
    required this.contactPhone,
    required this.carModel,
    required this.dealer,
    required this.carMake,
    required this.carGeneration,
  });

  @override
  List<Object?> get props => [
        carYear,
        gallery,
        publishedAt,
        isNew,
        price,
        currency,
        isWishlisted,
        userType,
        description,
        district,
        user,
        contactPhone,
        carModel,
        dealer,
        carMake,
        carGeneration
      ];
}

class CommercialItemConverter
    implements JsonConverter<CommercialItemEntity, Map<String, dynamic>?> {
  @override
  SearchItemModel fromJson(Map<String, dynamic>? json) =>
      SearchItemModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CommercialItemEntity object) => {};
}
