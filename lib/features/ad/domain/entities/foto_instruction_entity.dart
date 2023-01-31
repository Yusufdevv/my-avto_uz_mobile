import 'package:equatable/equatable.dart';

class FotoInstructionEntity extends Equatable {
  final int id;
  final int order;
  final String description;
  final String image;
  const FotoInstructionEntity(
      {this.image = '', this.description = '', this.id = -1, this.order = -1});
  @override
  List<Object?> get props => [
        id,
        order,
        description,
        image,
      ];
}
