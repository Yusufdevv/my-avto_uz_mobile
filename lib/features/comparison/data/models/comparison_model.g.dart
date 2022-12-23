// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparisonModel _$ComparisonModelFromJson(Map<String, dynamic> json) =>
    ComparisonModel(
      id: json['id'] as int? ?? 0,
      announcement: json['announcement'] == null
          ? const AnnouncementsEntity()
          : const AnnouncementsConverter()
              .fromJson(json['announcement'] as Map<String, dynamic>?),
      order: json['order'] as int? ?? 1,
    );

Map<String, dynamic> _$ComparisonModelToJson(ComparisonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'announcement':
          const AnnouncementsConverter().toJson(instance.announcement),
      'order': instance.order,
    };
