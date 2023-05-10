import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc()
      : super(
            const InternetState(isConnected: false, status: FormzStatus.pure)) {
    on<GlobalCheck>((event, emit) {
      emit(state.copyWith(isConnected: event.isConnected));
    });
    on<CheckConnectionStatus>((event, emit) async {
      final result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.ethernet ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.vpn) {
        emit(state.copyWith(isConnected: true));
      } else {
        emit(state.copyWith(isConnected: false));
      }
    });
  }
}
