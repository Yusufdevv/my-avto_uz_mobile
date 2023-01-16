// GENERATED CODE - DO NOT MODIFY BY HAND

<<<<<<<< HEAD:lib/features/dealers/data/models/mark_in_dealer_model.g.dart
part of 'mark_in_dealer_model.dart';
========
part of 'make_model_model.dart';
>>>>>>>> origin/bind_select_make_model:lib/features/ad/data/models/make_model_model.g.dart

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

<<<<<<<< HEAD:lib/features/dealers/data/models/mark_in_dealer_model.g.dart
MakeModel _$MakeModelFromJson(Map<String, dynamic> json) => MakeModel(
      id: json['id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
========
MakeModelModel _$MakeModelModelFromJson(Map<String, dynamic> json) =>
    MakeModelModel(
      id: json['id'] as int? ?? -1,
>>>>>>>> origin/bind_select_make_model:lib/features/ad/data/models/make_model_model.g.dart
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MakeModelModelToJson(MakeModelModel instance) =>
    <String, dynamic>{
      'name': instance.name,
<<<<<<<< HEAD:lib/features/dealers/data/models/mark_in_dealer_model.g.dart
      'slug': instance.slug,
      'logo': instance.logo,
========
      'id': instance.id,
>>>>>>>> origin/bind_select_make_model:lib/features/ad/data/models/make_model_model.g.dart
    };
