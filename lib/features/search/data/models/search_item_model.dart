import 'package:auto/features/search/domain/entities/car_dealer_entity.dart';
import 'package:auto/features/search/domain/entities/car_district_entity.dart';
import 'package:auto/features/search/domain/entities/car_generation_entity.dart';
import 'package:auto/features/search/domain/entities/car_make_entity.dart';
import 'package:auto/features/search/domain/entities/car_model_entity.dart';
import 'package:auto/features/search/domain/entities/car_user_entity.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_item_model.g.dart';

@JsonSerializable()
class SearchItemModel extends CommercialItemEntity {
  @JsonKey(name: 'car_year', defaultValue: 0)
  final int carYear;
  @JsonKey(name: 'description ', defaultValue: '')
  final String description;
  @JsonKey(name: 'gallery ', defaultValue: [])
  final List<String> gallery;
  @JsonKey(name: 'published_at ', defaultValue: '')
  final String publishedAt;
  @JsonKey(name: 'is_new ', defaultValue: false)
  final bool isNew;
  @JsonKey(name: 'price ', defaultValue: 0)
  final int price;
  @JsonKey(name: 'currency ', defaultValue: '')
  final String currency;
  @JsonKey(name: 'is_wishlisted ', defaultValue: false)
  final bool isWishlisted;
  @JsonKey(name: 'user_type ', defaultValue: '')
  final String userType;
  @JsonKey(name: 'contact_phone ', defaultValue: '')
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

  SearchItemModel({
    required this.carYear,
    required this.description,
    required this.gallery,
    required this.publishedAt,
    required this.isNew,
    required this.price,
    required this.isWishlisted,
    required this.currency,
    required this.userType,
    required this.contactPhone,
    required this.district,
    required this.user,
    required this.carModel,
    required this.dealer,
    required this.carGeneration,
    required this.carMake,
  }) : super(
          carYear: 0,
          description: '',
          gallery: [],
          publishedAt: '',
          isNew: false,
          price: 0,
          isWishlisted: false,
          currency: '',
          userType: '',
          contactPhone: '',
          district: district,
          user: user,
          carModel: carModel,
          dealer: dealer,
          carGeneration: carGeneration,
          carMake: carMake,
        );

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);
}
