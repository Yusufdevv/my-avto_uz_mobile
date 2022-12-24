import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';

class AdsEntity {
  final int id;
  final String make;
  final String model;
  final String generation;
  final List<String> imageUrl;
  final String region;
  final String description;
  final int year;
  final int viewCount;
  final double longitude;
  final double latitude;
  final CarUserEntity carUser;
  final String price;
  final bool isWishlisted;
  const AdsEntity({
    this.imageUrl = const [],
    this.price = '',
    this.model = '',
    this.id = 0,
    this.description = '',
    this.longitude = 0,
    this.latitude = 0,
    this.carUser = const CarUserEntity(),
    this.generation = '',
    this.make = '',
    this.region = '',
    this.viewCount = 0,
    this.year = 0,
    this.isWishlisted = false,
  });
}
