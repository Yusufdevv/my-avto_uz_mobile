import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pae_event.dart';
part 'pae_state.dart';

class PaeBloc extends Bloc<PaeEvent, PaeState> {
  PaeBloc() : super(const PaeState()) {
    on<PaeGoToEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 100));
      emit(state.copyWith(goTo: event.goTo));
    });
  }
}
