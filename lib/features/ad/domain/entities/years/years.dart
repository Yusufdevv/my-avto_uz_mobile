import 'package:auto/features/ad/data/models/years.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class YearsEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'year_begin', defaultValue: 0)
  final int yearBegin;
  @JsonKey(name: 'year_end', defaultValue: 0)
  final int yearEnd;
  @JsonKey(name: 'model', defaultValue: 0)
  final int modelId;

  const YearsEntity({
    required this.id,
    required this.yearBegin,
    required this.yearEnd,
    required this.modelId,
  });

  @override
  List<Object?> get props => [
        id,
        yearBegin,
        yearEnd,
        modelId,
      ];
}

class YearsEntityConverter
    extends JsonConverter<YearsEntity, Map<String, dynamic>?> {
  const YearsEntityConverter();

  @override
  YearsEntity fromJson(Map<String, dynamic>? json) =>
      YearsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(YearsEntity object) => {};
}
