import 'dart:async';

import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/ad/domain/entities/foto_instruction_entity.dart';
import 'package:auto/features/ad/domain/usecases/foto_instructions_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'add_image_instructions_event.dart';
part 'add_image_instructions_state.dart';

class PhotoInstructionBloc
    extends Bloc<PhotoInstructionEvent, PhotoInstructionState> {
  final PhotoInstructionsUseCase useCase;
  PhotoInstructionBloc({required this.useCase})
      : super(PhotoInstructionState(
            scrollController: ScrollController(),
            step: 0,
            instructions: const [/*
              FotoInstructionEntity(
                image: '',
                description:
                    '''Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.''',
              ),
              FotoInstructionEntity(
                image: '',
                description:
                    '''Удостоверьтесь, что госномер хорошо виден на фото. Это поможет нам проверить объявление, а покупателям мы его не покажем.''',
              ),
              FotoInstructionEntity(
                image: '',
                description:
                    '''Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.''',
              ),
              FotoInstructionEntity(
                  image: '',
                  description:
                      '''Удостоверьтесь, что госномер хорошо виден на фото. Это поможет нам проверить объявление, а покупателям мы его не покажем.'''),
            */],
            status: FormzStatus.pure)) {
    on<PhotoInstructionChangeStepEvent>(_changeStep);
    on<PhotoInstructionMoveStepEvent>(_move);
    on<PhotoInstructionGetEvent>(_get);
  }
  FutureOr<void> _get(PhotoInstructionGetEvent event,
      Emitter<PhotoInstructionState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await useCase.call(NoParams());
    if (result.isRight) {
      emit(state.copyWith(
          instructions: result.right.results, status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _move(PhotoInstructionMoveStepEvent event,
      Emitter<PhotoInstructionState> emit) {
    emit(state.copyWith(
        step: (event.isForward ? state.step + 1 : state.step - 1) %
            state.instructions.length));
  }

  FutureOr<void> _changeStep(PhotoInstructionChangeStepEvent event,
      Emitter<PhotoInstructionState> emit) async {
    emit(state.copyWith(step: event.step));
  }
}
