part of 'searched_bloc.dart';

class SearchedState extends Equatable {
   final List<String> searchedCars;

  const SearchedState({required this.searchedCars});

  SearchedState copyWith({
  List<String>? searchedCars
}) => SearchedState(searchedCars: searchedCars ?? this.searchedCars);
  @override
  List<Object?> get props => [searchedCars];
}
