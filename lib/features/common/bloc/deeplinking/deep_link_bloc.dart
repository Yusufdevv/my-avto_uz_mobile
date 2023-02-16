import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'deep_link_event.dart';
part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  static const dlStream = EventChannel('https.avto.uz/events');

  static const platform = MethodChannel('https.avto.uz/channel');

  final StreamController<String> _stateController = StreamController();

  Stream<String> get dlState => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  DeepLinkBloc() : super(DeepLinkInitial()) {
    startUri().then(_onRedirected);
    dlStream.receiveBroadcastStream().listen((d) => _onRedirected(d));
    on<DeepLinkChanged>((event, emit) {
      emit(DeepLinkInitial());
      String? parsedSlug;
      print('redirect url: ${event.uri}');
      if (event.uri.contains('musofirapp://org.uicgroup.musofir')) {
        parsedSlug =
            event.uri.replaceAll('musofirapp://org.uicgroup.musofir/', '');
        final List<String> pathParams = parsedSlug.split('/');
        if (pathParams.first == 'musofir') {
          emit(MusofirLinkTriggered(int.tryParse(pathParams.last) ?? 0));
        } else if (pathParams.first == 'user') {
          emit(UserLinkTriggered(int.tryParse(pathParams.last) ?? 0));
        }
      }
    });
  }

  void _onRedirected(String uri) {
    add(DeepLinkChanged(uri: uri));
    stateSink.add(uri);
  }

  Future<String> startUri() async {
    try {
      final link = await platform.invokeMethod('initialLink');
      add(DeepLinkChanged(uri: link));
      return link;
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  void dispose() {
    _stateController.close();
  }
}
