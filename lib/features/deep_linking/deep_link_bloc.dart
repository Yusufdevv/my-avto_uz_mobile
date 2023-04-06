import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'deep_link_event.dart';

part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  static const dlStream = EventChannel('https.avto.uz/events');

  static const platform = MethodChannel('https.avto.uz/channel');

  final StreamController<String> _stateController = StreamController();

  Stream<String> get dlState => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  DeepLinkBloc() : super(DeepLinkInitial()) {
    on<DeepLinkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
