import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_gearboxes_event.dart';
part 'get_gearboxes_state.dart';

class GetGearboxesBloc extends Bloc<GetGearboxesEvent, GetGearboxesState> {
  final GetGearBoxessUseCase getGearboxesUseCase;
  GetGearboxesBloc({required this.getGearboxesUseCase})
      : super(
            const GetGearboxesState(status: FormzStatus.pure, gearBoxes: [])) {
    on<GetGearboxesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getGearboxesUseCase.call(NoParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionSuccess,
            gearBoxes: result.right.results,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
