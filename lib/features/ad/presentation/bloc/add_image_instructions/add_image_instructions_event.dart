part of 'add_image_instructions_bloc.dart';

abstract class PhotoInstructionEvent {}

class PhotoInstructionMoveStepEvent extends PhotoInstructionEvent {
  final bool isForward;

  PhotoInstructionMoveStepEvent({required this.isForward});
}

class PhotoInstructionChangeStepEvent extends PhotoInstructionEvent {
  final int step;

  PhotoInstructionChangeStepEvent({required this.step});
}
class PhotoInstructionGetEvent extends PhotoInstructionEvent{
  
}
