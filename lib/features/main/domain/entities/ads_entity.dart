import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';

class AdsEntity {
  final int id;
  final String make;
  final String model;
  final String generation;
  final List<dynamic> gallery;
  final String region;
  final String description;
  final int year;
  final int viewCount;
  final double longitude;
  final double latitude;
  @CarUserConverter()
  final CarUserEntity user;
  final num price;
  final bool isComparison;
  final num discount;
  final String contactAvailableFrom;
  final String contactAvailableTo;
  final bool isNew;
  final String userType;
  final String currency;
  final String publishedAt;
  final String createdAt;
  final String expiredAt;
  final bool isWishlisted;

  AdsEntity({
    this.id = -1,
    this.make = '',
    this.model = '',
    this.generation = '',
    this.gallery = const [],
    this.region = '',
    this.description = '',
    this.year = 0,
    this.viewCount = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.user = const CarUserEntity(),
    this.price = 0,
    this.isComparison = false,
    this.discount = 0,
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
    this.isNew = false,
    this.userType = '',
    this.currency = '',
    this.publishedAt = '',
    this.createdAt = '',
    this.expiredAt = '',
    this.isWishlisted = false,
  });
}
