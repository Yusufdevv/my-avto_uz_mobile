import 'package:equatable/equatable.dart';

class FotoInstructionEntity extends Equatable {
  final String instruction;
  final String image;
  const FotoInstructionEntity({this.image = '', this.instruction = ''});
  @override
  List<Object?> get props => [instruction, image];
}
