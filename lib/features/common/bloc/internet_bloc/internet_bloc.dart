import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(const InternetState(isConnected: true)) {
    on<InternetEvent>((event, emit) {
      print('emit buldiyo');
      emit(state.copyWith(isConnected: event.isConnected));
    });
  }
}
