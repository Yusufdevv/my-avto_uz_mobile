part of 'suggestion_bloc.dart';

@Freezed()
class SuggestionEvent with _$SuggestionEvent {
  factory SuggestionEvent.getSuggestions({required String search}) =
      _GetSuggestions;

  factory SuggestionEvent.setSuggestions() = _SetSuggestions;

  factory SuggestionEvent.saveLocaleSuggestion({required String text}) =
      _SaveLocaleSuggestion;

  factory SuggestionEvent.deleteLocaleSuggestion({required String text}) =
      _DeleteLocaleSuggestion;

  factory SuggestionEvent.selectSearchSuggestion({required String text}) =
      _SelectLocaleSuggestion;

  factory SuggestionEvent.changeStatus({
    bool? isResultPage,
    bool? isLocaleSuggestion,
  }) = _ChangeStatus;
}
