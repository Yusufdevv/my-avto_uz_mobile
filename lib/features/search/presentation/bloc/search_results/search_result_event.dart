part of 'search_result_bloc.dart';

@Freezed()
 class SearchResultEvent with _$SearchResultEvent {
  factory SearchResultEvent.getResults({required String searchText})=_GetResults;
  factory SearchResultEvent.getMoreResults()=_GetMoreResults;
 }
