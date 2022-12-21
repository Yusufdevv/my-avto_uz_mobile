import 'package:equatable/equatable.dart';

class UserSearchesEntity extends Equatable {
  const UserSearchesEntity({
    this.id = 0,
    this.searchText = '',
  });

  final int id;
  final String searchText;

  @override
  List<Object?> get props => [id, searchText];
}
