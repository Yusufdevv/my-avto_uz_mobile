// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['id'] as int? ?? 0,
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
      archived: json['archived'] as bool? ?? false,
      avgStar: json['avg_star'] as String? ?? '',
      bodyType: json['body_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['body_type'] as Map<String, dynamic>?),
      comment: json['comment'] as String? ?? '',
      commentsCount: json['comments_count'] as int? ?? 0,
      driveType: json['drive_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['drive_type'] as Map<String, dynamic>?),
      engineType: json['engine_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['engine_type'] as Map<String, dynamic>?),
      gearboxType: json['gearbox_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      generation: json['generation'] == null
          ? const GenerateEntity()
          : const GenerateConverter()
              .fromJson(json['generation'] as Map<String, dynamic>?),
      isMine: json['is_mine'] as String? ?? '',
      make: json['make'] == null
          ? const MakeEntity()
          : const MakeEntityConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
      model: json['model'] == null
          ? const ModelEntity()
          : const ModelConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      modificationType: json['modification_type'] == null
          ? const ModificationTypeEntity()
          : const ModificationTypeEntityConverter()
              .fromJson(json['modification_type'] as Map<String, dynamic>?),
      negatives: (json['negatives'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      positives: (json['positives'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      starAnswers: (json['star_answers'] as List<dynamic>?)
              ?.map((e) => const StarAnswerConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      status: json['status'] as String? ?? '',
      tenure: json['tenure'] as String? ?? '',
      title: json['title'] as String? ?? '',
      viewsCount: json['views_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': const MakeEntityConverter().toJson(instance.make),
      'model': const ModelConverter().toJson(instance.model),
      'generation': const GenerateConverter().toJson(instance.generation),
      'body_type': const TypeConverter().toJson(instance.bodyType),
      'drive_type': const TypeConverter().toJson(instance.driveType),
      'engine_type': const TypeConverter().toJson(instance.engineType),
      'gearbox_type': const TypeConverter().toJson(instance.gearboxType),
      'modification_type': const ModificationTypeEntityConverter()
          .toJson(instance.modificationType),
      'absolute_car_name': instance.absoluteCarName,
      'title': instance.title,
      'comment': instance.comment,
      'tenure': instance.tenure,
      'positives': instance.positives,
      'negatives': instance.negatives,
      'avg_star': instance.avgStar,
      'star_answers':
          instance.starAnswers.map(const StarAnswerConverter().toJson).toList(),
      'status': instance.status,
      'archived': instance.archived,
      'is_mine': instance.isMine,
      'views_count': instance.viewsCount,
      'comments_count': instance.commentsCount,
    };
