part of 'search_bloc.dart';

@Freezed()
class SearchState with _$SearchState {
  factory SearchState({
    @Default([]) List<AutoEntity> searchResults,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    @Default('') String? next,
    @Default('') String? searchText,
    @Default(0) int count,
    @Default(false) moreFetch,
    @Default([]) List<OptionsEntity> suggestions,
    @Default(0) int suggestionsCount,
    @Default(false) bool? suggestionsFetchMore,
    @Default(FormzStatus.pure) FormzStatus suggestionsStatus,
    @Default(SortStatus.none) SortStatus sortStatus,
  }) = _SearchState;
}
