import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/data/datasources/get_user_lists_datasource.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'user_wishlists_notifications_event.dart';
part 'user_wishlists_notifiactions_state.dart';

class UserWishListsBloc extends Bloc<UserWishListsEvent, UserWishListsState> {
  final GetUserFavoritesMyAdsUseCase profileFavoritesMyAdsUseCase;
  final GetNotificationSingleUseCase getNotificationSingleUseCase;
  final GetNotificationsUseCase getNotificationsUseCase;
  final GetMySearchesUseCase getMySearchesUseCase;

  UserWishListsBloc(
      {required this.profileFavoritesMyAdsUseCase,
      required this.getNotificationSingleUseCase,
      required this.getNotificationsUseCase,
      required this.getMySearchesUseCase,
      })
      : super(UserWishListsState(
          favoritesStatus: FormzStatus.pure,
          myAdsStatus: FormzStatus.pure,
          favorites: const <AutoEntity>[],
          myAds: const <AutoEntity>[],
          notifications: const <NotificationsEntity>[],
          notificationSingle: NotificationsEntity(),
          mySearches: const <MySearchesEntity>[],
        )) {
    on<GetUserFavoritesEvent>(_onGetUserFavorites);
    on<GetUserMyAdsEvent>(_onGetUserMyAds);
    on<GetMySearchesEvent>(_onGetMySearches);
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

  Future<void> _onGetMySearches(
      GetMySearchesEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getMySearchesUseCase.call(NoParams());
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, mySearches: result.right));
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
          myAdsStatus: FormzStatus.submissionSuccess,
          notifications: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetNotificationSingle(GetNotificationSingleEvent event,
      Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getNotificationSingleUseCase.call(event.id);
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess,
          notificationSingle: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }
}
