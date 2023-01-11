// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverImageThumbnailModel _$CoverImageThumbnailModelFromJson(
        Map<String, dynamic> json) =>
    CoverImageThumbnailModel(
      crop: json['crop'] as String? ?? '',
      square: json['square'] as String? ?? '',
    );

Map<String, dynamic> _$CoverImageThumbnailModelToJson(
        CoverImageThumbnailModel instance) =>
    <String, dynamic>{
      'crop': instance.crop,
      'square': instance.square,
    };
