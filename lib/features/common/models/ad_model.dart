import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ad_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AdModel extends AdsEntity {
  AdModel({
    super.id = -1,
    super.make = '',
    super.model = '',
    super.generation = '',
    super.gallery = const [],
    super.region = '',
    super.description = '',
    super.year = 0,
    super.viewCount = 0,
    super.longitude = 0,
    super.latitude = 0,
    super.user = const CarUserEntity(),
    super.price = 0,
    super.isComparison = false,
    super.discount = 0,
    super.contactAvailableFrom = '',
    super.contactAvailableTo = '',
    super.isNew = false,
    super.userType = '',
    super.currency = '',
    super.publishedAt = '',
    super.createdAt = '',
    super.expiredAt = '',
    super.isWishlisted = false,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);
}
