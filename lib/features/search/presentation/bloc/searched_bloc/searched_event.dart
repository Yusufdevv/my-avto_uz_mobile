part of 'searched_bloc.dart';

abstract class SearchedEvent extends Equatable {
  const SearchedEvent();
}


class RemoveSearchItem extends SearchedEvent{
  final String carName;
  const RemoveSearchItem({required this.carName});
  @override
  List<Object?> get props => [carName];
}

class ClearSearchItem extends SearchedEvent{
  const ClearSearchItem();
  @override
  List<Object?> get props => [];

}