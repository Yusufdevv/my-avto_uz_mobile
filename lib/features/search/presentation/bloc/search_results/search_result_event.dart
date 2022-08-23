part of 'search_result_bloc.dart';

@Freezed()
 class SearchResultEvent with _$SearchResultEvent {
  factory SearchResultEvent.getResults({required bool isRefresh})=_GetResults;
  factory SearchResultEvent.getMoreResults()=_GetMoreResults;
 }
