
import 'package:auto/features/search/data/models/absolute_car_name_suggest_model.dart';
import 'package:auto/features/search/domain/entities/option_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AbsoluteCarNameSuggestCompletionEntity extends Equatable {
  const AbsoluteCarNameSuggestCompletionEntity({
    this.text = '',
    this.offset = 0,
    this.length = 0,
    this.options = const [],
  });

  final String text;
  final int offset;
  final int length;
  @OptionConverter()
  final List<OptionEntity> options;
  @override
  List<Object?> get props => [];
}

class AbsoluteCarNameSuggestCompletionConverter
    implements JsonConverter<AbsoluteCarNameSuggestCompletionEntity, Map<String, dynamic>?> {
  const AbsoluteCarNameSuggestCompletionConverter();

  @override
  AbsoluteCarNameSuggestCompletionEntity fromJson(Map<String, dynamic>? json) =>
      AbsoluteCarNameSuggestModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(AbsoluteCarNameSuggestCompletionEntity object) => {};
}
