import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'years.g.dart';

@JsonSerializable()
class YearsModel extends YearsEntity {
  const YearsModel({
    required super.id,
    required super.yearBegin,
    required super.yearEnd,
    required super.modelId,
  });

  factory YearsModel.fromJson(Map<String, dynamic> json) =>
      _$YearsModelFromJson(json);
}
