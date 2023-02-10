part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesBlocEvent with _$GetMakesBlocEvent {
  factory GetMakesBlocEvent.getMakes() = _GetMakes;
  factory GetMakesBlocEvent.getTopMakes() = _GetTopMakes;
  factory GetMakesBlocEvent.getSerched(String naem) = _GetSerched;
  factory GetMakesBlocEvent.changeSelected(int id) = _ChangeSelected;
  factory GetMakesBlocEvent.sortMakes(String letter) = _SortMakes;
  factory GetMakesBlocEvent.getIsCheck() = _GetIsCheck;
  factory GetMakesBlocEvent.getNextTop() = _GetNextTop;
  factory GetMakesBlocEvent.getIndex(String index) = _GetIndex;

  factory GetMakesBlocEvent.selectedCarItems(
      {required int id,
      required String name,
      required String imageUrl, 
      required MakeEntity makeEntity,}) = _SelectedCarItems;

  factory GetMakesBlocEvent.confirmCarOption() = _ConfirmCarOption;
  factory GetMakesBlocEvent.revertCarOption() = _RevertCarOption;
}
