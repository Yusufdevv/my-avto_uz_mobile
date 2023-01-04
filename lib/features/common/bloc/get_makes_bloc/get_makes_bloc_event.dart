part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesBlocEvent with _$GetMakesBlocEvent {
  factory GetMakesBlocEvent.getMakes() = _GetMakes;
  factory GetMakesBlocEvent.getSerched(String naem) = _GetSerched;
  factory GetMakesBlocEvent.changeSelected(int index) = _ChangeSelected;
}