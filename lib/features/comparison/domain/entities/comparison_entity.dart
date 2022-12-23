import 'package:auto/features/comparison/data/models/comparison_model.dart';
import 'package:auto/features/comparison/domain/entities/announcement_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class ComparisonEntity extends Equatable {
  const ComparisonEntity({
    this.id = 0,
    this.announcement = const AnnouncementsEntity(),
    this.order = 1,
  });

  final int id;
  @AnnouncementsConverter()
  final AnnouncementsEntity announcement;
  final int order;

  @override
  List<Object?> get props => [id, announcement, order];
}

class ComparisonConverter
    implements JsonConverter<ComparisonEntity, Map<String, dynamic>?> {
  const ComparisonConverter();
  @override
  ComparisonEntity fromJson(Map<String, dynamic>? json) =>
      ComparisonModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ComparisonEntity object) => {};
}
