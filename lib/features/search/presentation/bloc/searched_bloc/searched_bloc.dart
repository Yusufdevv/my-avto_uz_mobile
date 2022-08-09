import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searched_event.dart';

part 'searched_state.dart';

class SearchedBloc extends Bloc<SearchedEvent, SearchedState> {
  final List<String> carsList;
  SearchedBloc({required this.carsList}) : super(SearchedState(searchedCars: carsList)) {
    on<RemoveSearchItem>((event, emit) {
      final carsList = <String>[...state.searchedCars];
      if (carsList.contains(event.carName)) {
        carsList.remove(event.carName);
      }
      emit(state.copyWith(searchedCars: carsList));
    });

    on<ClearSearchItem>((event, emit) {

      emit(state.copyWith(searchedCars: []));
    });
  }
}
