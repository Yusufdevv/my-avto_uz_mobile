import 'package:auto/features/car_single/data/model/announcment_verify_owner_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AnnouncementVerifyOwnerEntity extends Equatable {
  final int id;
  final String moderationStatus;
  final String comment;

  const AnnouncementVerifyOwnerEntity({
    this.id = 0,
    this.moderationStatus = '',
    this.comment = '',
  });

  @override
  List<Object?> get props => [
        id,
        moderationStatus,
        comment,
      ];
}

class AnnouncementVerifyOwnerEntityConverter
    implements
        JsonConverter<AnnouncementVerifyOwnerEntity, Map<String, dynamic>?> {
  const AnnouncementVerifyOwnerEntityConverter();

  @override
  AnnouncementVerifyOwnerEntity fromJson(Map<String, dynamic>? json) =>
      AnnouncementVerifyOwnerModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(AnnouncementVerifyOwnerEntity object) => {};
}
