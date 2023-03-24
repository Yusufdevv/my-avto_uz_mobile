import 'package:auto/features/car_single/domain/entities/announcement_verify_owner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcment_verify_owner_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnnouncementVerifyOwnerModel extends AnnouncementVerifyOwnerEntity {
  const AnnouncementVerifyOwnerModel({
    required super.id,
    required super.moderationStatus,
    required super.comment,
  });

  factory AnnouncementVerifyOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementVerifyOwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementVerifyOwnerModelToJson(this);
}
