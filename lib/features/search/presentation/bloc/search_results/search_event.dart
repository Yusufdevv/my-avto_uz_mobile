part of 'search_bloc.dart';

@Freezed()
class SearchEvent with _$SearchEvent {
  factory SearchEvent.getResults({required String searchText}) = _GetResults;
  factory SearchEvent.getMoreResults() = _GetMoreResults;

  factory SearchEvent.getSuggestions({required String search}) =
      _GetSuggestions;

  factory SearchEvent.setSuggestions() = _SetSuggestions;

  factory SearchEvent.saveLocaleSuggestion({required String text}) =
      _SaveLocaleSuggestion;

  factory SearchEvent.deleteLocaleSuggestion({required String text}) =
      _DeleteLocaleSuggestion;

  factory SearchEvent.selectSearchSuggestion({required String text}) =
      _SelectLocaleSuggestion;

  factory SearchEvent.changeStatus() = _ChangeStatus;
}
