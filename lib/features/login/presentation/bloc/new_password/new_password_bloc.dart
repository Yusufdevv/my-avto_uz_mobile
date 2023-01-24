import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  final ChangePasswordInLoginUseCase changePassword;
  NewPasswordBloc({required this.changePassword, required String phone})
      : super(NewPasswordState(status: FormzStatus.pure, phone: phone)) {
    on<NewPasswordEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final result = await changePassword.call(
          ChangePassParam(phone: state.phone, validPassword: event.password));
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionCanceled,
            toastMessage: (result.left as ServerFailure).errorMessage));
      }
    });
  }
}
