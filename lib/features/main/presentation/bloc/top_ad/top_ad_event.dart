part of 'top_ad_bloc.dart';

@Freezed()
 class TopAdEvent with _$TopAdEvent {
  factory TopAdEvent.getTopAds()=_GetTopAds;
  factory TopAdEvent.getMoreTopAds()=_GetMoreTopAds;
}