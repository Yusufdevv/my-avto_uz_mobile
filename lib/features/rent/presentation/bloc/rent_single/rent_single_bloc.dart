import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_single_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_single_event.dart';
part 'rent_single_state.dart';

class RentSingleBloc extends Bloc<RentSingleEvent, RentSingleState> {
  final RentSingleUseCase rentSingleUseCase;
  RentSingleBloc({required this.rentSingleUseCase})
      : super(const RentSingleState(
            rentCar: RentListEntity(), status: FormzStatus.pure)) {
    on<RentSingleGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await rentSingleUseCase.call(event.rentCarId);
      if (result.isRight) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, rentCar: result.right),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionCanceled));
      }
    });
  }
}
