import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/search/domain/entities/search_suggest_entity.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:auto/features/search/domain/usecases/suggestion_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';

part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResultsUseCase useCase = GetSearchResultsUseCase();
  final SuggestionUseCase suggestionUseCase = SuggestionUseCase();

  SearchBloc() : super(SearchState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(
          status: FormzStatus.submissionInProgress,
          searchText: event.searchText));

      final result = await useCase.call({
        'search': event.searchText,
        'ordering': state.sortStatus.value,
        'limit': 10,
        'offset': 0,
      });
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess,
              searchResults: result.right.results,
              moreFetch: result.right.next != null),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreResults>((event, emit) async {
      final result = await useCase({
        'search': event.searchText,
        'ordering': state.sortStatus.value,
        'limit': 10,
        'offset': state.searchResults.length,
      });
      if (result.isRight) {
        emit(
          state.copyWith(
            searchResults: [...state.searchResults, ...result.right.results],
            moreFetch: result.right.next != null,
          ),
        );
      }
    });

    on<_SetSortStatus>((event, emit) {
      emit(state.copyWith(sortStatus: event.sortStatus));
      add(SearchEvent.getResults(searchText: state.searchText ?? ''));
    });

    on<_GetSuggestions>((event, emit) async {
      emit(state.copyWith(suggestionsStatus: FormzStatus.submissionInProgress));
      final result = await suggestionUseCase.call(event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            suggestions:
                result.right.absoluteCarNameSuggestCompletion[0].options,
            suggestionsStatus: FormzStatus.submissionSuccess,
            suggestionsCount:
                result.right.absoluteCarNameSuggestCompletion[0].options.length,
          ),
        );
      }
    });
  }
}
