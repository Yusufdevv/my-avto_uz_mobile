part of 'search_rent_bloc.dart';

@immutable
abstract class SearchRentEvent {}

class SearchRent extends SearchRentEvent {
  final String search;

  SearchRent({required this.search});
}

class MoreSearchRent extends SearchRentEvent {}
