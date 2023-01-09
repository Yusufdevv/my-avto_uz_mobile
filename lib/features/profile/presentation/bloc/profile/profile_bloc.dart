import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';
import 'package:auto/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_terms_of_use_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository repository;

  final ProfileUseCase profileUseCase;
  final EditProfileUseCase editProfileUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final GetTermsOfUseUseCase getTermsOfUseUseCase;

  ProfileBloc({
    required this.profileUseCase,
    required this.editProfileUseCase,
    required this.changePasswordUseCase,
    required this.getTermsOfUseUseCase,
    required this.repository,

    
  }) : super(
          ProfileState(
            changeStatus: FormzStatus.pure,
            editStatus: FormzStatus.pure,
            status: FormzStatus.pure,
            profileEntity: ProfileDataEntity(),
            termsOfUseEntity: const <TermsOfUseEntity>[],
          ),
        ) { 
          
    on<GetProfileEvent>(_onGetProfile);
    on<ChangePasswordEvent>(_onChangePassword);
    on<EditProfileEvent>(_onEditProfile);
    on<GetTermsOfUseEvent>(_onGetTermsOfUse);
    on<LoginUser>(_onLoginUser);
  }
  
  Future<void> _onGetProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
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
  }

  Future<void> _onGetTermsOfUse(
      GetTermsOfUseEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getTermsOfUseUseCase.call(NoParams());
    if (result.isRight) {
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        termsOfUseEntity: result.right,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onEditProfile(
      EditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(editStatus: FormzStatus.submissionInProgress));
    final result = await editProfileUseCase.call(EditProfileParams(
      surName: event.surName,
      region: event.region,
      name: event.name,
      image: event.image,
    ));
    if (result.isRight) {
      emit(state.copyWith(editStatus: FormzStatus.submissionSuccess));
      event.onSuccess();
    } else {
      emit(state.copyWith(editStatus: FormzStatus.submissionFailure));
      event.onError(result.left.toString());
    }
  }

  Future<void> _onChangePassword(
      ChangePasswordEvent event, Emitter<ProfileState> emit) async {
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
          event.onSuccess(result.right);
          emit(state.copyWith(changeStatus: FormzStatus.submissionSuccess));
        } else {
          event.onError(result.left.toString());
          emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
        }
      } else {
        event.onError('Parol xato');
        emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
      }
    } else {
      event.onError("Ma'lumotlarni to'ldiring");
      emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onLoginUser(LoginUser event,Emitter<ProfileState> emit) async {
      final result = await repository.login(
          login: event.phone, password: event.password);
      if (result.isRight) {
        print('auth good ');
      } 

    }


  
}
