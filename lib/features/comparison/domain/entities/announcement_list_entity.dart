import 'package:auto/features/comparison/domain/entities/user_entity.dart';

class AnnouncementEntity {
  AnnouncementEntity({
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
    this.price = '',
    this.isComparison = false,
    this.discount = '',
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
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
  final String price;
  final bool isComparison;
  final String discount;
  final String contactAvailableFrom;
  final String contactAvailableTo;
  final bool isWishlisted;
}
