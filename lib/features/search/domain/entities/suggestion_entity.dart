import 'package:auto/features/search/domain/entities/absolute_car_name_suggest_completion_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SuggestionEntity extends Equatable {
  const SuggestionEntity({
    this.absoluteCarNameSuggestCompletion = const [],
  });
  @JsonKey(name:'absolute_car_name_suggest__completion')
  @AbsoluteCarNameSuggestCompletionConverter()
  final List<AbsoluteCarNameSuggestCompletionEntity>
      absoluteCarNameSuggestCompletion;

  @override
  List<Object?> get props => [];
}
