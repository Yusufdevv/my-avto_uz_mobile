import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:auto/features/rent/domain/usecases/register_lease_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_lease_event.dart';
part 'register_lease_state.dart';

class RegisterLeaseBloc extends Bloc<RegisterLeaseEvent, RegisterLeaseState> {
  RegisterLeaseUseCase useCase;
  RegisterLeaseBloc({required this.useCase})
      : super(const RegisterLeaseState(
            status: FormzStatus.pure, errorMessage: '')) {
    on<RegisterLeaseEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.lease);
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: result.left.toString()));
      }
    });
  }
}
