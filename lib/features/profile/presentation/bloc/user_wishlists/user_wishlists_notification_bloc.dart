import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_wishlists_notifications_event.dart';
part 'user_wishlists_notifiactions_state.dart';

class UserWishListsBloc extends Bloc<UserWishListsEvent, UserWishListsState> {
  final GetUserFavoritesMyAdsUseCase profileFavoritesUseCase;

  UserWishListsBloc({required this.profileFavoritesUseCase})
      : super(const UserWishListsState(
          favoritesStatus: FormzStatus.pure,
          myAdsStatus: FormzStatus.pure,
          favorites: <AutoEntity>[],
          myAds: <AutoEntity>[],
        )) {
    on<GetUserFavoritesEvent>(_onGetUserFavorites);
    on<GetUserMyAdsEvent>(_onGetUserMyAds);
    on<GetUserHistoryEvent>(_onGetUserHistory);
  }

  Future<void> _onGetUserFavorites(
      GetUserFavoritesEvent event, Emitter<UserWishListsState> emit) async {
    emit(state.copyWith(favoritesStatus: FormzStatus.submissionInProgress));
    final result = await profileFavoritesUseCase.call(event.endpoint);
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
    final result = await profileFavoritesUseCase.call(event.endpoint);
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
    final result = await profileFavoritesUseCase.call(event.endpoint);
    if (result.isRight) {
      emit(state.copyWith(
          myAdsStatus: FormzStatus.submissionSuccess, myAds: result.right));
    } else {
      emit(state.copyWith(myAdsStatus: FormzStatus.submissionFailure));
    }
  }
}
