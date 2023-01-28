import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'add_image_instructions_event.dart';
part 'add_image_instructions_state.dart';

class AddImageInstructionsBloc
    extends Bloc<AddImageInstructionsEvent, AddImageInstructionsState> {
  AddImageInstructionsBloc()
      : super(const AddImageInstructionsState(
            step: 0,
            instructions: [
              '''Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.''',
              '''Удостоверьтесь, что госномер хорошо виден на фото. Это поможет нам проверить объявление, а покупателям мы его не покажем.''',
              '''Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.''',
              '''Удостоверьтесь, что госномер хорошо виден на фото. Это поможет нам проверить объявление, а покупателям мы его не покажем.''',
              '''Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.''',
              '''Удостоверьтесь, что госномер хорошо виден на фото. Это поможет нам проверить объявление, а покупателям мы его не покажем.'''
            ],
            status: FormzStatus.pure)) {
    on<AddImageInstructionsChangeStepEvent>(_changeStep);
  }
  FutureOr<void> _changeStep(AddImageInstructionsChangeStepEvent event,
      Emitter<AddImageInstructionsState> emit) async {
    emit(state.copyWith(step: event.forward? state.step + 1: state.step - 1));
  }
}
