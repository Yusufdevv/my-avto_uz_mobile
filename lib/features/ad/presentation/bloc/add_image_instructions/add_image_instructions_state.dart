part of 'add_image_instructions_bloc.dart';

class PhotoInstructionState extends Equatable {
  final ScrollController scrollController;

  final FormzStatus status;
  final int step;
  final List<FotoInstructionEntity> instructions;
  const PhotoInstructionState({
    required this.scrollController,
    required this.instructions,
    required this.status,
    required this.step,
  });
  PhotoInstructionState copyWith(
          {int? step,
          FormzStatus? status,
      List<FotoInstructionEntity>? instructions,
          bool? isAnimate}) =>
      PhotoInstructionState(
        scrollController: scrollController,
        instructions: instructions ?? this.instructions,
        status: status ?? this.status,
        step: step ?? this.step,
      );
  @override
  List<Object?> get props =>
      [status, instructions, step,  scrollController];
}
