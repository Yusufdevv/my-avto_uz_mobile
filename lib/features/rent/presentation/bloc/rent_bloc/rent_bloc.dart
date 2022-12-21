import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_event.dart';

part 'rent_state.dart';

part 'rent_bloc.freezed.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase rentUseCase;
  final int id;

  RentBloc(this.rentUseCase, this.id) : super(RentState()) {
    on<_GetResults>((event, emit) async {
      print('${state.hasAirConditioners}get start');
      if (!event.isRefresh) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      }

      final result = await rentUseCase(Param(
        next: '',
        id: id,
        // hasAirConditioner: state.hasAirConditioners,
        // hasBabySeat: state.hasBabySeat,
        // rentCarIsClean: state.rentCarIsClean,
        // rentCarIsFullFuel: state.rentCarIsFullFuel,
      ));
      if (result.isRight) {
        print(' ==== ${result.right.toString()} ===== the get result right');
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
      print('${state.hasAirConditioners}get end');
    });
    on<_GetMoreResults>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await rentUseCase(Param(next: state.next!, id: id));
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
    on<_SetId>((event, emit) async {
      print('${state.hasAirConditioners}set start');
      emit(state.copyWith(
        categoryId: id,
        hasBabySeat: event.hasBabySeat ?? state.hasBabySeat,
        hasAirConditioners: event.hasAirConditioner ?? state.hasAirConditioners,
        rentCarIsFullFuel: event.rentCarIsFullFuel ?? state.rentCarIsFullFuel,
        rentCarIsClean: event.rentCarIsClean ?? state.rentCarIsClean,
      ));
      add(RentEvent.getResults(isRefresh: true));

      print('${state.hasAirConditioners}set end');
    });
  }
}
