// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelModel _$ReelModelFromJson(Map<String, dynamic> json) => ReelModel(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      likeCount: json['like_count'] as int? ?? 0,
      shareCount: json['share_count'] as int? ?? 0,
      dealer: json['dealer'] == null
          ? const DealerEntity()
          : const DealerConverter()
              .fromJson(json['dealer'] as Map<String, dynamic>?),
      announcement: json['announcement'] == null
          ? const AnnouncementEntity()
          : const AnnouncementConverter()
              .fromJson(json['announcement'] as Map<String, dynamic>?),
      isLiked: json['is_liked'] as bool? ?? true,
      isOfferOfTheDay: json['is_offer_of_the_day'] as bool? ?? false,
    );

Map<String, dynamic> _$ReelModelToJson(ReelModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'like_count': instance.likeCount,
      'share_count': instance.shareCount,
      'dealer': const DealerConverter().toJson(instance.dealer),
      'announcement':
          const AnnouncementConverter().toJson(instance.announcement),
      'is_liked': instance.isLiked,
      'is_offer_of_the_day': instance.isOfferOfTheDay,
    };
