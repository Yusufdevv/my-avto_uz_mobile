// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcment_verify_owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementVerifyOwnerModel _$AnnouncementVerifyOwnerModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementVerifyOwnerModel(
      id: json['id'] as int? ?? 0,
      moderationStatus: json['moderation_status'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$AnnouncementVerifyOwnerModelToJson(
        AnnouncementVerifyOwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'moderation_status': instance.moderationStatus,
      'comment': instance.comment,
    };
