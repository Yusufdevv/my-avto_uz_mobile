part of 'top_ad_bloc.dart';

@Freezed()
class TopAdEvent with _$TopAdEvent {
  factory TopAdEvent.getTopAds() = _GetTopAds;
  factory TopAdEvent.getFavorites() = _GetFavorites;
  factory TopAdEvent.getMoreTopAds() = _GetMoreTopAds;
  factory TopAdEvent.getMoreFavorite() = _GetMoreFavorite;
  factory TopAdEvent.changeIsWish({required int index, required int id}) =
      _ChangeIsWish;
  factory TopAdEvent.deleteFavoriteItem(
      {required int id, required bool adding}) = _DeleteFavoriteItem;
}
