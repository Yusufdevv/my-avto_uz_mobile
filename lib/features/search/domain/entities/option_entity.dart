
import 'package:auto/features/search/data/models/option_model.dart';
import 'package:auto/features/search/domain/entities/source_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class OptionEntity extends Equatable {
  const OptionEntity({
    this.text = '',
    this.index = '',
    this.type = '',
    this.id = '',
    this.score = 0,
    this.source = const SourceEntity(),
  });
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: '_index')
  final String index;
  @JsonKey(name: '_type')
  final String type;
   @JsonKey(name: '_id')
  final String id;
   @JsonKey(name: '_score')
  final double score;
   @JsonKey(name: '_source')
  @SourceConverter()
  final SourceEntity source;
  @override
  List<Object?> get props => [];
}

class OptionConverter
    implements JsonConverter<OptionEntity, Map<String, dynamic>?> {
  const OptionConverter();

  @override
  OptionEntity fromJson(Map<String, dynamic>? json) =>
      OptionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(OptionEntity object) => {};
}
