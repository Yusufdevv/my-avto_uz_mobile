part of 'add_image_instructions_bloc.dart';

class AddImageInstructionsState extends Equatable {
  final FormzStatus status;
  final int step;
  final List<String> instructions;
  const AddImageInstructionsState({
    required this.instructions,
    required this.status,
    required this.step,
  });
  AddImageInstructionsState copyWith(
          {int? step, FormzStatus? status, List<String>? instructions}) =>
      AddImageInstructionsState(
        instructions: instructions ?? this.instructions,
        status: status ?? this.status,
        step: step ?? this.step,
      );
  @override
  List<Object?> get props => [status, instructions, step];
}
