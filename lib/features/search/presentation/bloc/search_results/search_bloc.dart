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
  final GetSearchResultsUseCase useCase;
  final SuggestionUseCase suggestionUseCase;

  SearchBloc(this.useCase, {required this.suggestionUseCase})
      : super(SearchState()) {
    on<_GetResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await useCase.call(event.searchText);
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            searchResults: result.right.results,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase(state.next);
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            searchResults: [...state.searchResults, ...result.right.results],
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });

    on<_GetSuggestions>((event, emit) async {
      emit(state.copyWith(suggestionsStatus: FormzStatus.submissionInProgress));
      final result = await suggestionUseCase.call(event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            suggestions: result.right.absoluteCarNameSuggestCompletion[0].options,
            suggestionsStatus: FormzStatus.submissionSuccess,
            suggestionsCount:
                result.right.absoluteCarNameSuggestCompletion[0].options.length,
          ),
        );
      }
    });
    on<_DeleteResultItem>(_onChangeIsWish);

  }
  void _onChangeIsWish(_DeleteResultItem event, Emitter<SearchState> emit) {
    var list = <AutoEntity>[...state.searchResults];
    final item = list.firstWhere((element) => element.id==event.id);
    final index = list.indexOf(item);
    list[index].isWishlisted = !list[index].isWishlisted;
    emit(state.copyWith(searchResults: list));
  }
}
