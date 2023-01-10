import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class AdModel extends AdsEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'make')
  final String make;
  @JsonKey(name: 'model')
  final String model;
  @JsonKey(name: 'generation')
  final String generation;
  final List<String> images;
  @JsonKey(name: 'region')
  final String region;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'view_count')
  final int viewCount;
  @JsonKey(name: 'longitude')
  final double longitude;
  @JsonKey(name: 'latitude')
  final double latitude;
  @CarUserConverter()
  final CarUserEntity user;
  @JsonKey(name: 'is_wishlisted')
  final bool isWishlisted;
  @JsonKey(name: 'price')
  final int price;

  AdModel({
    this.id = 0,
    this.viewCount = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.year = 0,
    this.make = '',
    this.model = '',
    this.generation = '',
    this.region = '',
    this.description = '',
    this.images = const [],
    this.user = const CarUserEntity(),
    this.isWishlisted = false,
    this.price = 0,
  }) : super(
          id: id,
          viewCount: viewCount,
          longitude: longitude,
          latitude: latitude,
          year: year,
          make: make,
          model: model,
          generation: generation,
          region: region,
          description: description,
          imageUrl: images,
          carUser: user,
          isWishlisted: isWishlisted,
          price: price,
        );

  factory AdModel.fromJson(Map<String, dynamic> json) => _$AdModelFromJson(json);
}
