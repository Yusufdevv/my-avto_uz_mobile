import 'package:auto/features/common/domain/entity/car_dealer_entity.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/comparison/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementListModel extends AnnouncementListEntity {
  AnnouncementListModel({
    required super.contactAvailableFrom,
    required super.contactAvailableTo,
    required super.description,
    required super.discount,
    required super.gallery,
    required super.generation,
    required super.id,
    required super.isComparison,
    required super.isWishlisted,
    required super.latitude,
    required super.longitude,
    required super.make,
    required super.model,
    required super.price,
    required super.region,
    required super.user,
    required super.viewsCount,
    required super.year,
    required super.createdAt,
    required super.currency,
    required super.dealer,
    required super.isNew,
    required super.publishedAt,
    required super.userType,
  });

  factory AnnouncementListModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementListModelToJson(this);
}
