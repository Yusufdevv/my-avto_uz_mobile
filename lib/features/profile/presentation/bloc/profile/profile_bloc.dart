import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/profile/data/models/profile.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/features/profile/domain/usecases/change_password.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile.dart';
import 'package:auto/features/profile/domain/usecases/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;
  final EditProfileUseCase editProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  ProfileBloc({
    required this.profileUseCase,
    required this.editProfileUseCase,
    required this.changePasswordUseCase,
  }) : super(
          ProfileState(
              changeStatus: FormzStatus.pure,
              editStatus: FormzStatus.pure,
              status: FormzStatus.pure,
              profileEntity: ProfileModel.fromJson(const {})),
        ) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await profileUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          profileEntity: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<EditProfileEvent>((event, emit) async {
      emit(state.copyWith(editStatus: FormzStatus.submissionInProgress));
      final result = await editProfileUseCase.call(EditProfileParams(
        surName: event.surName,
        region: event.region,
        name: event.name,
        image: event.image,
      ));
      if (result.isRight) {
        event.onSuccess();
      } else {
        event.onError(result.left.toString());
      }
    });

    on<ChangePasswordEvent>((event, emit) async {
      emit(state.copyWith(changeStatus: FormzStatus.submissionInProgress));

      if (event.oldPassword.isNotEmpty &&
          event.newPassword.isNotEmpty &&
          event.newPasswordConfirm.isNotEmpty) {
        if (event.newPassword == event.newPasswordConfirm) {
          final result = await changePasswordUseCase.call(ChangePasswordParams(
            oldPassword: event.oldPassword,
            newPassword: event.newPassword,
          ));

          if (result.isRight) {
            event.onSuccess();
            emit(state.copyWith(changeStatus: FormzStatus.submissionInProgress));
          } else {
            event.onError(result.left.toString());
            emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
          }
        } else {
          event.onError('Parol xato');
          emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
        }
      } else {
        event.onError("Ma'lumotlarni Требованияto'ldiring");
        emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
