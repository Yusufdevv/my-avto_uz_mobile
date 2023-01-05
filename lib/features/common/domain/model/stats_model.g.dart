// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) => StatsModel(
      viewsCount: json['views_count'] as int? ?? 0,
      viewedContactsCount: json['viewed_contacts_count'] as int? ?? 0,
      wishlistCount: json['wishlist_count'] as int? ?? 0,
    );

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) =>
    <String, dynamic>{
      'views_count': instance.viewsCount,
      'wishlist_count': instance.wishlistCount,
      'viewed_contacts_count': instance.viewedContactsCount,
    };
