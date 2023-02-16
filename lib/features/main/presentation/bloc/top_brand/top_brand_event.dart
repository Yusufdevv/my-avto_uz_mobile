part of 'top_brand_bloc.dart';

@Freezed()
class TopBrandEvent with _$TopBrandEvent {
  factory TopBrandEvent.getBrand() = _GetBrand;
  factory TopBrandEvent.getMoreBrand() = _GetMoreBrand;
  factory TopBrandEvent.sortBarands(String letter) = _SortBrands;
}
