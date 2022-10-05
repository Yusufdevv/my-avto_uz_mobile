import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/search_rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'search_rent_event.dart';
part 'search_rent_state.dart';

class SearchRentBloc extends Bloc<SearchRentEvent, SearchRentState> {
  final SearchRentUseCase searchRentUseCase;

  SearchRentBloc(this.searchRentUseCase) : super(const SearchRentState()) {
    on<SearchRent>((event, emit) async {
      if (event.search.isNotEmpty) {
        emit(state.copyWith(searchStatus: FormzStatus.submissionInProgress));
        final results =
            await searchRentUseCase.call(SearchParams(query: event.search));
        if (results.isRight) {
          emit(
            state.copyWith(
                searchRents: results.right.results,
                searchStatus: FormzStatus.submissionSuccess,
                searchFetchMore: results.right.next != null,
                next: results.right.next),
          );
        } else {
          emit(state.copyWith(searchStatus: FormzStatus.submissionFailure));
        }
      } else {
        emit(state.copyWith(
            searchRents: [], searchStatus: FormzStatus.submissionSuccess));
      }
    });
    on<MoreSearchRent>((event, emit) async {
      emit(state.copyWith(searchStatus: FormzStatus.submissionInProgress));
      final results = await searchRentUseCase
          .call(SearchParams(query: '', next: state.next));
      if (results.isRight) {
        emit(state.copyWith(
          searchRents: [...state.searchRents, ...results.right.results],
          searchStatus: FormzStatus.submissionSuccess,
          searchFetchMore: results.right.next != null,
          next: results.right.next,
        ));
      } else {
        emit(state.copyWith(searchStatus: FormzStatus.submissionFailure));
      }
    }, transformer: droppable());
  }
}
