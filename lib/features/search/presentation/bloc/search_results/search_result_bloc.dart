import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/entity/auto_review_entity.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
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
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await useCase.call(event.searchText);
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: result.right.results,
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
            list: [...state.list, ...result.right.results],
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    });
  }
}
