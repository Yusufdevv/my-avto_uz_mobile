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
    required this.imageUrl,
    required this.price,
    required this.model,
    required this.id,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.carUser,
    required this.generation,
    required this.make,
    required this.region,
    required this.viewCount,
    required this.year,
    required this.isWishlisted,
  });
}
