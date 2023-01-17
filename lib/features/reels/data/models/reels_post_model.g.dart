// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelsPostModel _$ReelsPostModelFromJson(Map<String, dynamic> json) =>
    ReelsPostModel(
      reel: json['reel'] as int? ?? 0,
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$ReelsPostModelToJson(ReelsPostModel instance) =>
    <String, dynamic>{
      'reel': instance.reel,
      'status': instance.status,
    };
