import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/models/ad_model.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'top_ad_bloc.freezed.dart';
part 'top_ad_event.dart';
part 'top_ad_state.dart';

class TopAdBloc extends Bloc<TopAdEvent, TopAdState> {
  final GetTopAdsUseCase getTopBrand;
  final GetUserFavoritesMyAdsUseCase profileFavoritesMyAdsUseCase =
      GetUserFavoritesMyAdsUseCase();

  TopAdBloc(this.getTopBrand) : super(TopAdState()) {
    on<_GetTopAds>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getTopBrand('');
      if (result.isRight) {
        emit(state.copyWith(
            next: result.right.next,
            count: result.right.count,
            status: FormzStatus.submissionSuccess,
            topAds: result.right.results));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreTopAds>((event, emit) async {
      final result = await getTopBrand(state.next);
      if (result.isRight) {
        emit(state.copyWith(
          topAds: [...state.topAds, ...result.right.results],
          next: result.right.next,
          count: result.right.count,
        ));
      } else {}
    });

    on<_GetFavorites>((event, emit) async {
      emit(state.copyWith(favoritesStatus: FormzStatus.submissionInProgress));
      final result = await profileFavoritesMyAdsUseCase.call(state.nextF);
      if (result.isRight) {
        emit(state.copyWith(
          favoritesStatus: FormzStatus.submissionSuccess,
          favorites: result.right.results,
          nextF: result.right.next          
        ));
      } else {
        emit(state.copyWith(favoritesStatus: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreFavorite>((event, emit) async {
      final result = await profileFavoritesMyAdsUseCase(state.nextF);
      if (result.isRight) {
        emit(state.copyWith(
          favorites: [...state.favorites, ...result.right.results],
          nextF: result.right.next,
        ));
      } else {}
    });

    on<_ChangeIsWish>(_onChangeIsWish);
  }

  void _onChangeIsWish(_ChangeIsWish event, Emitter<TopAdState> emit) {
    // ignore: prefer_final_locals
    var list = <AdModel>[...state.topAds];
    final item = list.firstWhere((element) => element.id == event.id);
    final index = list.indexOf(item);
    list[index].isWishlisted = !list[index].isWishlisted;
    emit(state.copyWith(topAds: list));
  }
}
