part of 'searched_bloc.dart';
@Freezed()
class SearchEvent  with _$SearchEvent  {
factory SearchEvent.getSearchResults({required String search})=_GetSearchResults;
}


