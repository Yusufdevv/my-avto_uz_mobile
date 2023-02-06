part of 'marks_in_dealers_bloc.dart';

@Freezed()
class MarksInDealersEvent with _$MarksInDealersEvent {
  factory MarksInDealersEvent.getResults({required String slug}) = _GetResults;
  factory MarksInDealersEvent.getMoreResults({required String slug}) = _GetMoreResults;
}