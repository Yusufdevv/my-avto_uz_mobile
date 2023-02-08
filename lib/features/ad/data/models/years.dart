import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'years.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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
