part of 'add_image_instructions_bloc.dart';

abstract class AddImageInstructionsEvent {}

class AddImageInstructionsChangeStepEvent extends AddImageInstructionsEvent {
  final bool forward;
  AddImageInstructionsChangeStepEvent({required this.forward});
}
