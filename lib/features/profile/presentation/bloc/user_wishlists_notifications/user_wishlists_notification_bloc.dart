import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/usecases/delete_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/notification_all_read_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'user_wishlists_notifications_event.dart';
part 'user_wishlists_notifiactions_state.dart';

class UserWishListsBloc extends Bloc<UserWishListsEvent, UserWishListsState> {
  final GetUserFavoritesMyAdsUseCase profileFavoritesMyAdsUseCase =
      GetUserFavoritesMyAdsUseCase();
  final GetNotificationSingleUseCase getNotificationSingleUseCase =
      GetNotificationSingleUseCase();
  final GetNotificationsUseCase getNotificationsUseCase =
      GetNotificationsUseCase();
  final GetMySearchesUseCase getMySearchesUseCase = GetMySearchesUseCase();
  final NotificationAllReadUseCase notificationAllReadUseCase =
      NotificationAllReadUseCase();
  final DeleteMySearchesUseCase deleteMySearchesUseCase =
      DeleteMySearchesUseCase();
  UserWishListsBloc()
      : super(UserWishListsState(
          favoritesStatus: FormzStatus.pure,
          myAdsStatus: FormzStatus.pure,
          favorites: const <AutoEntity>[],
          myAds: const <AutoEntity>[],
          notifications: const <NotificationsEntity>[],
          notificationSingle: NotificationsEntity(),
          mySearches: const <MySearchesEntity>[],
          count: 0,
          nextMyAds: '',
          moreFetchMyAds: false,
          nextNotifications: '',
          nextFavorites: '',
          nextMySearches: '',
          moreFetchNotifications: false,
          moreFetchFavorites: false,
          moreFetchMySearches: false,
        )) {
    on<GetUserFavoritesEvent>(_onGetUserFavorites);
    on<GetMoreUserFavoritesEvent>(_onGetMoreUserFavorites);
    on<GetUserMyAdsEvent>(_onGetUserMyAds);
    on<GetMoreUserMyAdsEvent>(_onGetMoreUserMyAds);
    on<GetMySearchesEvent>(_onGetMySearches);
    on<GetMoreMySearchesEvent>(_onGetMoreMySearches);
    on<GetNotificationsEvent>(_onGetNotifications);
    on<GetMoreNotificationsEvent>(_onGetMoreNotifications);
    on<GetNotificationSingleEvent>(_onGetNotificationSingle);
    on<NotificationAllReadEvent>(_onNotificationAllReadEvent);
    on<DeleteMySearchesEvent>(_onDeleteMySearchesEvent);
    on<ChangeIsWishEvenet>(_onChangeIsWish);
    on<ChangeReadEvent>(_onChangeRead);
  }
  // delete favoritesItem  from favorites in state
  void _onChangeIsWish(
      ChangeIsWishEvenet event, Emitter<UserWishListsState> emit) {
    final list = <AutoEntity>[...state.favorites];
    final item = list.firstWhere((element) => element.id == event.id);
    // ignore: cascade_invocations
    list.remove(item);
    emit(state.copyWith(favorites: list));
  }

  void _onChangeRead(ChangeReadEvent event, Emitter<UserWishListsState> emit) {
    final list = <NotificationsEntity>[...state.notifications];
    list[event.index].isRead = !list[event.index].isRead!;
    emit(state.copyWith(notifications: list));
  }

  Future<void> _onGetUserFavorites(
      GetUserFavoritesEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(favoritesStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesMyAdsUseCase
        .call(Params(endpoint: '/users/wishlist/announcement/list/'));
    if (result.isRight) {
      emit(state.copyWith(
          favoritesStatus: FormzStatus.submissionSuccess,
          favorites: result.right.results,
          nextFavorites: result.right.next,
          moreFetchFavorites: result.right.next != null));
    } else {
      emit(state.copyWith(favoritesStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetMoreUserFavorites(
      GetMoreUserFavoritesEvent event, Emitter<UserWishListsState> emit) async {
    final result = await profileFavoritesMyAdsUseCase.call(Params(
        endpoint: '/users/wishlist/announcement/list/',
        query: state.nextFavorites));
    if (result.isRight) {
      emit(state.copyWith(
          favorites: [...state.favorites, ...result.right.results],
          nextFavorites: result.right.next,
          moreFetchFavorites: result.right.next != null));
    }
  }

  Future<void> _onNotificationAllReadEvent(
      NotificationAllReadEvent event, Emitter<UserWishListsState> emit) async {
    final result = await notificationAllReadUseCase.call(NoParams());
    if (result.isRight) {}
  }

  Future<void> _onDeleteMySearchesEvent(
      DeleteMySearchesEvent event, Emitter<UserWishListsState> emit) async {
    final result = await deleteMySearchesUseCase.call(event.ids);
    if (result.isRight) {}
  }

  Future<void> _onGetUserMyAds(
      GetUserMyAdsEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesMyAdsUseCase.call(Params(
        endpoint: '/car/my-announcements/',
        moderationStatus: event.moderationStatus));
    if (result.isRight) {
      emit(state.copyWith(
        myAdsStatus: FormzStatus.submissionSuccess,
        myAds: result.right.results,
        nextMyAds: result.right.next,
        moreFetchMyAds: result.right.next != null,
      ));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetMoreUserMyAds(
      GetMoreUserMyAdsEvent event, Emitter<UserWishListsState> emit) async {
    final result = await profileFavoritesMyAdsUseCase.call(Params(
        endpoint: '/car/my-announcements/',
        query: state.nextMyAds,
        moderationStatus: event.moderationStatus));
    if (result.isRight) {
      emit(state.copyWith(
        myAds: [...state.myAds, ...result.right.results],
        nextMyAds: result.right.next,
        moreFetchMyAds: result.right.next != null,
      ));
    }
  }

  Future<void> _onGetMySearches(
      GetMySearchesEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getMySearchesUseCase.call('');
    if (result.isRight) {
      emit(state.copyWith(
        myAdsStatus: FormzStatus.submissionSuccess,
        mySearches: result.right.results,
        nextMySearches: result.right.next,
        moreFetchMySearches: result.right.next != null,
      ));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetMoreMySearches(
      GetMoreMySearchesEvent event, Emitter<UserWishListsState> emit) async {
    final result = await getMySearchesUseCase.call(state.nextMySearches);
    if (result.isRight) {
      emit(state.copyWith(
        mySearches: [...state.mySearches, ...result.right.results],
        nextMySearches: result.right.next,
        moreFetchMySearches: result.right.next != null,
      ));
    }
  }

  Future<void> _onGetNotifications(
      GetNotificationsEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(myAdsStatus: FormzStatus.submissionInProgress));
    final result = await getNotificationsUseCase
        .call(NotificationParams(filter: event.filter));
    if (result.isRight) {
      emit(state.copyWith(
        myAdsStatus: FormzStatus.submissionSuccess,
        notifications: result.right.results,
        nextNotifications: result.right.next,
        moreFetchNotifications: result.right.next != null,
      ));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }

  Future<void> _onGetMoreNotifications(
      GetMoreNotificationsEvent event, Emitter<UserWishListsState> emit) async {
    final result = await getNotificationsUseCase
        .call(NotificationParams(next: state.nextNotifications));
    if (result.isRight) {
      emit(state.copyWith(
        notifications: [...state.notifications, ...result.right.results],
        nextNotifications: result.right.next,
        moreFetchNotifications: result.right.next != null,
      ));
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
