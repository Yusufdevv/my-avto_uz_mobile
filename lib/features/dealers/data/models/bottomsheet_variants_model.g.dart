// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottomsheet_variants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BottomsheetVariantsModel _$BottomsheetVariantsModelFromJson(
        Map<String, dynamic> json) =>
    BottomsheetVariantsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$BottomsheetVariantsModelToJson(
        BottomsheetVariantsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl,
      'id': instance.id,
    };
