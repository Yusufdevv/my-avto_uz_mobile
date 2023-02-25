import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';
import 'package:auto/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_terms_of_use_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository repository = AuthRepository();
  final ProfileUseCase profileUseCase = ProfileUseCase();
  final EditProfileUseCase editProfileUseCase = EditProfileUseCase();
  final ChangePasswordUseCase changePasswordUseCase = ChangePasswordUseCase();
  final GetTermsOfUseUseCase getTermsOfUseUseCase = GetTermsOfUseUseCase();
  final GetNotificationsUseCase getNotificationsUseCase =
      GetNotificationsUseCase();
  ProfileBloc()
      : super(
          ProfileState(
              changeStatus: FormzStatus.pure,
              editStatus: FormzStatus.pure,
              status: FormzStatus.pure,
              profileEntity: ProfileDataEntity(usercountdata: Usercountdata()),
              termsOfUseEntity: TermsOfUseEntity(),
              isNotificationAllRead: true),
        ) {
    on<GetProfileEvent>(_onGetProfile);
    on<ChangePasswordEvent>(_onChangePassword);
    on<EditProfileEvent>(_onEditProfile);
    on<GetTermsOfUseEvent>(_onGetTermsOfUse);
    on<LoginUser>(_onLoginUser);
    on<ChangeCountDataEvent>(_onChangeCountData);
    on<GetNoReadNotificationsEvent>(_onGetNoReadNotificationsEvent);

    on<ChangeNotificationAllRead>(
      // notifikatsiya iconini bosganda iconni o'zgartirish
      (event, emit) {
        emit(state.copyWith(editStatus: FormzStatus.submissionInProgress));
        // ignore: prefer_final_locals
        var user = state.profileEntity;
        // ignore: cascade_invocations
        user.isReadAllNotifications = true;
        emit(state.copyWith(
            profileEntity: user, editStatus: FormzStatus.submissionSuccess));
      },
    );
  }
  void _onChangeCountData(
      ChangeCountDataEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(changeStatus: FormzStatus.submissionInProgress));
    // ignore: prefer_final_locals
    var profileData = state.profileEntity;
    var announcementWishlistCount =
        profileData.usercountdata.announcementWishlistCount;
    var mySearchesCount = profileData.usercountdata.filterHistoryCount;
    var myAdsCount = profileData.usercountdata.announcementsCount;
    if (event.adding) {
      if (event.favoritesCount != null) {
        announcementWishlistCount += event.favoritesCount!;
      }
      if (event.mySearchesCount != null) {
        mySearchesCount += event.mySearchesCount!;
      }
      if (event.myAdsCount != null) {
        myAdsCount += event.myAdsCount!;
      }
    } else {
      if (event.favoritesCount != null && announcementWishlistCount > 0) {
        announcementWishlistCount -= event.favoritesCount!;
      }
      if (event.mySearchesCount != null && mySearchesCount > 0) {
        mySearchesCount -= event.mySearchesCount!;
      }
      if (event.myAdsCount != null && myAdsCount > 0) {
        myAdsCount -= event.myAdsCount!;
      }
    }
    profileData.usercountdata.announcementWishlistCount =
        announcementWishlistCount;
    profileData.usercountdata.filterHistoryCount = mySearchesCount;
    profileData.usercountdata.announcementsCount = myAdsCount;

    emit(state.copyWith(
        profileEntity: profileData,
        changeStatus: FormzStatus.submissionSuccess));
  }

  Future<void> _onGetNoReadNotificationsEvent(
      GetNoReadNotificationsEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(changeStatus: FormzStatus.submissionInProgress));
    final result = await getNotificationsUseCase
        .call(NotificationParams(filter: event.filter));
    if (result.isRight) {
      emit(state.copyWith(
          changeStatus: FormzStatus.submissionSuccess,
          isNotificationAllRead: result.right.results.isEmpty));
    } else {
      emit(state.copyWith(changeStatus: FormzStatus.submissionFailure));
    }
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
    final result = await getTermsOfUseUseCase.call(event.slug);
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
        region: event.region,
        fullName: event.fullName,
        image: event.image,
        email: event.email));
    if (result.isRight) {
      emit(state.copyWith(editStatus: FormzStatus.submissionSuccess));
      event.onSuccess();
    } else {
      final error = (result.left as ServerFailure).errorMessage;
      emit(state.copyWith(editStatus: FormzStatus.submissionFailure));
      event.onError(error);
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
          final err = (result.left is ServerFailure)
              ? (result.left as ServerFailure).errorMessage
              : result.left.toString();
          event.onError(err);
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

  Future<void> _onLoginUser(LoginUser event, Emitter<ProfileState> emit) async {
    // ignore: unused_local_variable
    final result =
        await repository.login(login: event.phone, password: event.password);
  }
}
