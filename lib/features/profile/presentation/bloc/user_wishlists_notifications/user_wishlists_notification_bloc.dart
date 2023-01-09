import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_wishlists_notifications_event.dart';
part 'user_wishlists_notifiactions_state.dart';

class UserWishListsBloc extends Bloc<UserWishListsEvent, UserWishListsState> {
  final GetUserFavoritesMyAdsUseCase profileFavoritesMyAdsUseCase;
  final GetNotificationSingleUseCase getNotificationSingleUseCase;
  final GetNotificationsUseCase getNotificationsUseCase;

  UserWishListsBloc({required this.profileFavoritesMyAdsUseCase, required this.getNotificationSingleUseCase, required this.getNotificationsUseCase})
      : super( UserWishListsState(
          favoritesStatus: FormzStatus.pure,
          myAdsStatus: FormzStatus.pure,
          favorites:const <AutoEntity>[],
          myAds:const <AutoEntity>[],
          notifications: const <NotificationsEntity>[],
          notificationSingle: NotificationsEntity(),
        )) {
    on<GetUserFavoritesEvent>(_onGetUserFavorites);
    on<GetUserMyAdsEvent>(_onGetUserMyAds);
    on<GetUserHistoryEvent>(_onGetUserHistory);
    on<GetNotificationsEvent>(_onGetNotifications);
    on<GetNotificationSingleEvent>(_onGetNotificationSingle);
  }

  Future<void> _onGetUserFavorites(
      GetUserFavoritesEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(favoritesStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesMyAdsUseCase.call(event.endpoint);
    if (result.isRight) {
      emit(state.copyWith(
          favoritesStatus: FormzStatus.submissionSuccess,
          favorites: result.right));
    } else {
      emit(state.copyWith(favoritesStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetUserMyAds(
      GetUserMyAdsEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesMyAdsUseCase.call(event.endpoint);
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, myAds: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetUserHistory(
      GetUserHistoryEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesMyAdsUseCase.call(event.endpoint);
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, myAds: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }
  
  Future<void> _onGetNotifications(
      GetNotificationsEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getNotificationsUseCase.call(NoParams());
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, notifications: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetNotificationSingle(
      GetNotificationSingleEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getNotificationSingleUseCase.call(event.id);
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, notificationSingle: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }




}
