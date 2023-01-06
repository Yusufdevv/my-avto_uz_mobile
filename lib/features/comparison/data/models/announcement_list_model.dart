import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementListModel extends AnnouncementEntity {
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
  });

   factory AnnouncementListModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementListModelToJson(this);
}
