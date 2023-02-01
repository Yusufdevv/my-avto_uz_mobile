import 'package:auto/features/common/domain/entity/car_dealer_entity.dart';
import 'package:auto/features/comparison/domain/entities/user_entity.dart';

class AnnouncementListEntity {
 const AnnouncementListEntity({
    this.id = 0,
    this.make = '',
    this.model = '',
    this.generation = '',
    this.gallery = const [],
    this.region = '',
    this.description = '',
    this.year = 0,
    this.viewsCount = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.user = const UserEntity(),
    this.price = 0,
    this.isComparison = false,
    this.discount = 0,
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
    this.isNew = false,
    this.dealer = const CarDealerEntity(),
    this.userType = '',
    this.currency = '',
    this.publishedAt = '',
    this.createdAt = '',
    this.isWishlisted = false,
  });

  final int id;
  final String make;
  final String model;
  final String generation;
  final List<String> gallery;
  final String region;
  final String description;
  final int year;
  final int viewsCount;
  final double longitude;
  final double latitude;
  @UserConverter()
  final UserEntity user;
  final double price;
  final bool isComparison;
  final double? discount;
  final String contactAvailableFrom;
  final String contactAvailableTo;
  final bool isNew;
  @CarDealerConverter()
  final CarDealerEntity dealer;
  final String userType;
  final String currency;
  final String publishedAt;
  final String createdAt;
  final bool isWishlisted;
}
