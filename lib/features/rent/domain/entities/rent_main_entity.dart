import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:equatable/equatable.dart';

class RentMainEntity extends Equatable {
  final int id;
  final String name;
  @RentListConverter()
  final List<RentListEntity> rentList;

  const RentMainEntity({
    this.id = 0,
    this.name = '',
    this.rentList = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        rentList,
      ];
}
