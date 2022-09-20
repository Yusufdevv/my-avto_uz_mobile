import 'package:auto/features/login/data/models/register.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SendCodeUseCase sendCodeUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;

  RegisterBloc({
    required this.sendCodeUseCase,
    required this.registerUseCase,
    required this.verifyCodeUseCase,
  }) : super(RegisterState()) {
    on<_VerifyCode>((event, emit) async {
      emit(state.copyWith(verifyStatus: FormzStatus.submissionInProgress));
      final result = await verifyCodeUseCase(event.param);
      if (result.isRight) {
        print(result.right+'from Bloc');
        emit(state.copyWith(registerModel: state.registerModel.copyWith(phoneNumber: result.right),
          verifyStatus: FormzStatus.submissionSuccess,
        ));
        if (event.onSuccess != null) {
          event.onSuccess!();
        }
      } else {
        emit(state.copyWith(verifyStatus: FormzStatus.submissionInProgress));
      }
    });
    on<_SendCode>((event, emit) async {
      emit(state.copyWith(sendCodeStatus: FormzStatus.submissionInProgress));
      final result = await sendCodeUseCase(event.phone);
      if (result.isRight) {
        emit(state.copyWith(
          sendCodeStatus: FormzStatus.submissionSuccess,
        ));
        if (event.onSuccess != null) {
          event.onSuccess!(result.right);
        }
      } else {
        emit(state.copyWith(sendCodeStatus: FormzStatus.submissionInProgress));
      }
    });

    on<_SetName>((event, emit) async {
      emit(state.copyWith(
          registerModel: state.registerModel
              .copyWith(fullName: event.fullName, email: event.email)));
      if (event.onSuccess != null) {
        event.onSuccess!();
      }
    });
    on<_Register>((event, emit) async {
      emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));
      final result = await registerUseCase(
          state.registerModel.copyWith(password: event.validPassword));
      if (result.isRight) {
        emit(state.copyWith(
          registerStatus: FormzStatus.submissionSuccess,
        ));
        if (event.onSuccess != null) {
          event.onSuccess!();
        }
      } else {
        emit(state.copyWith(registerStatus: FormzStatus.submissionInProgress));
      }
    });
    on<_ChangeImage>((event, emit) {
      emit(
        state.copyWith(
          registerModel: state.registerModel.copyWith(image: event.path),
        ),
      );
    });
    on<_ChangeRegion>((event, emit) {
      emit(state.copyWith(
          registerModel: state.registerModel.copyWith(region: event.region)));
    });
  }
}
