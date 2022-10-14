import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/domain/usecases/get_search_result.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_event.dart';

part 'search_result_state.dart';

part 'search_result_bloc.freezed.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final GetSearchResultsUseCase useCase;

  SearchResultBloc(this.useCase) : super(SearchResultState()) {
    on<_GetResults>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }

      final result = await useCase('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: result.right.results,
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase(state.next);
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: [...state.list, ...result.right.results],
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }
}
