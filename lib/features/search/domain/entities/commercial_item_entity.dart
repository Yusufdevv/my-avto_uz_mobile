import 'package:auto/features/search/data/models/search_item_model.dart';
import 'package:auto/features/common/domain/entity/car_dealer_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
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
     this.carYear = 0,
     this.gallery = const [],
     this.publishedAt = '',
     this.isNew = false,
     this.price = 0,
     this.currency = '',
     this.isWishlisted = false,
     this.userType = '',
     this.description = '',
     this.district = const CarDistrictEntity(),
     this.user = const CarUserEntity(),
     this.contactPhone = '',
     this.carModel = const CarModelEntity(),
     this.dealer = const CarDealerEntity(),
     this.carMake = const CarMakeEntity(),
     this.carGeneration = const CarGenerationEntity(),
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
