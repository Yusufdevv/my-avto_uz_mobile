part of 'dealer_single_bloc.dart';

// abstract class DealerSingleEvent {}
//
// class DealerSingleGetEvent extends DealerSingleEvent {
//   final String dealerSlug;
//   DealerSingleGetEvent({required this.dealerSlug});
// }
@Freezed()
class DealerSingleEvent with _$DealerSingleEvent {
  factory DealerSingleEvent.getResults({required String slug}) = _GetResults;
}
