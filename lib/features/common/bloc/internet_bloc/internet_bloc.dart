import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc()
      : super(
            const InternetState(isConnected: true, status: FormzStatus.pure)) {
    on<GlobalCheck>((event, emit) {
      print('emit buldiyo');
      emit(state.copyWith(isConnected: event.isConnected));
    });

  }
}
