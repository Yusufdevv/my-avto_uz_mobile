part of 'get_makes_bloc_bloc.dart';

@Freezed()
class GetMakesBlocEvent with _$GetMakesBlocEvent {
  const factory GetMakesBlocEvent.getMakes({String? name}) = _GetMakes;
  const factory GetMakesBlocEvent.getSerched(String naem) = _GetSerched;
}