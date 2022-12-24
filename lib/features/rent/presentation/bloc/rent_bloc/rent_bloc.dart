import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase rentUseCase;

  RentBloc({required this.rentUseCase, required int id})
      : super(RentState(
          categoryId: id,
          count: 5,
          hasAirConditioners: 0,
          hasBabySeat: 0,
          list: const [],
          next: '',
          paginationStatus: FormzStatus.pure,
          rentCarIsClean: 0,
          rentCarIsFullFuel: 0,
          status: FormzStatus.pure,
        )) {
    on<RentGetResultsEvent>((event, emit) async {
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }
      final result = await rentUseCase(Param(
        next: '',
        id: state.categoryId,
        hasAirConditioner: state.hasAirConditioners,
        hasBabySeat: state.hasBabySeat,
        rentCarIsClean: state.rentCarIsClean,
        rentCarIsFullFuel: state.rentCarIsFullFuel,
      ));
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
    on<RentGetMoreEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result =
          await rentUseCase(Param(next: state.next!, id: state.categoryId));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            list: [...state.list, ...result.right.results],
            count: result.right.count,
            next: result.right.next));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<RentSetIdEvent>((event, emit) async {
      emit(state.copyWith(
        categoryId: event.categoryId,
        hasBabySeat: event.hasBabySeat ?? state.hasBabySeat,
        hasAirConditioners: event.hasAirConditioner ?? state.hasAirConditioners,
        rentCarIsFullFuel: event.rentCarIsFullFuel ?? state.rentCarIsFullFuel,
        rentCarIsClean: event.rentCarIsClean ?? state.rentCarIsClean,
      ));
      add(RentGetResultsEvent(isRefresh: true));
    });
  }
}
