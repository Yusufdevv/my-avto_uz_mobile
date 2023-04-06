import 'dart:async';

import 'package:bloc/bloc.dart';
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
    dlStream.receiveBroadcastStream().listen((v) => _onRedirected(v));
    on<DeepLinkChangedEvent>(
      (event, emit) {
        emit(DeepLinkInitial());
        String? parsedSlug;
        if (event.uri.contains('org.uicgroup.avto.uz')) {
          parsedSlug =
              event.uri.replaceAll('avtouz://org.uicgroup.avto.uz/', '');
          final pathParams = parsedSlug.split('/');
          if (pathParams.first == 'reels') {
            emit(DeepLinkTriggeredByReelState());
          }
        } else if (event.uri.contains('https://avto.uz')) {
          parsedSlug = event.uri.replaceAll('https://avto.uz/', '');
          final pathParams = parsedSlug.split('/');
          if (pathParams.first == 'reels') {
            emit(DeepLinkTriggeredByReelState());
          }
        }
      },
    );
  }

  void _onRedirected(String uri) {
    add(DeepLinkChangedEvent(uri: uri));
    stateSink.add(uri);
  }

  Future<String> startUri() async {
    try {
      final link = await platform.invokeMethod('initialLink');
      add(DeepLinkChangedEvent(uri: link));
      return link;
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  void dispose() {
    _stateController.close();
  }
}
