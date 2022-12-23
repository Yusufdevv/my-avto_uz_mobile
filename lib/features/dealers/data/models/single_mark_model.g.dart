// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_mark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleMarkModel _$SingleMarkModelFromJson(Map<String, dynamic> json) =>
    SingleMarkModel(
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      mark: json['mark'] as String,
      year: json['year'] as int,
    );

Map<String, dynamic> _$SingleMarkModelToJson(SingleMarkModel instance) =>
    <String, dynamic>{
      'mark': instance.mark,
      'description': instance.description,
      'year': instance.year,
      'amount': instance.amount,
    };
