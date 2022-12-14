import 'package:auto/features/ad/data/models/generation.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class GenerationEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'year_begin', defaultValue: 0)
  final int yearBegin;
  @JsonKey(name: 'year_end', defaultValue: 0)
  final int yearEnd;
  @JsonKey(name: 'model', defaultValue: 0)
  final int modelId;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;

  const GenerationEntity({
    required this.id,
    required this.name,
    required this.yearBegin,
    required this.yearEnd,
    required this.modelId,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        yearBegin,
        yearEnd,
        modelId,
        logo,
      ];
}

class GenerationEntityConverter
    extends JsonConverter<GenerationEntity, Map<String, dynamic>?> {
  const GenerationEntityConverter();

  @override
  GenerationEntity fromJson(Map<String, dynamic>? json) =>
      GenerationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(GenerationEntity object) => {};
}
