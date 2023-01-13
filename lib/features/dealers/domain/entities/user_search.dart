import 'package:equatable/equatable.dart';

class UserSearchesDealerEntity extends Equatable {
  const UserSearchesDealerEntity({
    this.id = 0,
    this.searchText = '',
  });

  final int id;
  final String searchText;

  @override
  List<Object?> get props => [id, searchText];
}