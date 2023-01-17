// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_reel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeReelResponse _$LikeReelResponseFromJson(Map<String, dynamic> json) =>
    LikeReelResponse(
      reel: json['reel'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LikeReelResponseToJson(LikeReelResponse instance) =>
    <String, dynamic>{
      'reel': instance.reel,
      'status': instance.status,
    };
