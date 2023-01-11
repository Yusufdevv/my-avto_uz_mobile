part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesBlocEvent with _$GetMakesBlocEvent {
  factory GetMakesBlocEvent.getMakes() = _GetMakes;
  factory GetMakesBlocEvent.getSerched(String naem) = _GetSerched;
  factory GetMakesBlocEvent.changeSelected(int id) = _ChangeSelected;

  factory GetMakesBlocEvent.selectedCarItems(
      {required int id,required String name,required String imageUrl}) = _SelectedCarItems;

  factory GetMakesBlocEvent.confirmCarOption()= _ConfirmCarOption;
  factory GetMakesBlocEvent.revertCarOption() = _RevertCarOption;
}
