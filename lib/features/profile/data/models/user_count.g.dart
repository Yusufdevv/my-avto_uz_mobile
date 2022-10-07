// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsercountdataModel _$UsercountdataModelFromJson(Map<String, dynamic> json) =>
    UsercountdataModel(
      id: json['id'] as int? ?? 0,
      user: json['user'] as int? ?? 0,
      announcementCount: json['announcement_count'] as int? ?? 0,
      comparesCount: json['compares_count'] as int? ?? 0,
      reviewsCount: json['reviews_count'] as int? ?? 0,
      searchCount: json['search_count'] as int? ?? 0,
      wishListCount: json['announcement_wishlist_count'] as int? ?? 0,
    );

Map<String, dynamic> _$UsercountdataModelToJson(UsercountdataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'announcement_wishlist_count': instance.wishListCount,
      'compares_count': instance.comparesCount,
      'announcement_count': instance.announcementCount,
      'search_count': instance.searchCount,
      'reviews_count': instance.reviewsCount,
    };
