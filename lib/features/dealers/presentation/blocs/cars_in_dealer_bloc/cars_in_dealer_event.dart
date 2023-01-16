part of 'cars_in_dealer_bloc.dart';

@Freezed()
class CarsInDealerEvent with _$CarsInDealerEvent {
  factory CarsInDealerEvent.getResults({required String slug}) = _GetResults;
}