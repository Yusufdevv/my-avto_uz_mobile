import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

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
