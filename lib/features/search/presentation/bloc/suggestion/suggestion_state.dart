part of 'suggestion_bloc.dart';

@Freezed()
class SuggestionState with _$SuggestionState {
  factory SuggestionState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<CarMakeModel> suggestions,
    @Default('') String? next,
    @Default('') String? previous,
    @Default(0) int count,
  }) = _SuggestionState;
}
