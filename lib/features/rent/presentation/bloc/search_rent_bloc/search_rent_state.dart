part of 'search_rent_bloc.dart';

class SearchRentState extends Equatable {
  final FormzStatus searchStatus;
  final String? next;
  final List<RentMainEntity> searchRents;
  final bool searchFetchMore;
  final String search;
  const SearchRentState({
    this.searchStatus = FormzStatus.submissionSuccess,
    this.next,
    this.searchRents = const [],
    this.searchFetchMore = false,
    this.search = '',
  });
  SearchRentState copyWith(
          {FormzStatus? searchStatus,
          String? next,
          List<RentMainEntity>? searchRents,
          bool? searchFetchMore,
          String? search}) =>
      SearchRentState(
        next: next,
        searchStatus: searchStatus ?? this.searchStatus,
        searchRents: searchRents ?? this.searchRents,
        searchFetchMore: searchFetchMore ?? this.searchFetchMore,
        search: search ?? this.search,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        next,
        searchStatus,
        searchRents,
        searchFetchMore,
        search,
      ];
}
