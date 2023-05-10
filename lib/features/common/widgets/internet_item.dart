import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivityScreen extends StatelessWidget {
  const InternetConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return StreamBuilder<ConnectivityResult>(
        stream: connectivity.onConnectivityChanged,
        builder: (context, snapshot) => InetWidget(
              snapshot: snapshot,
              widget: const Text(''),
            ));
  }
}

class InetWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;

  const InetWidget({Key? key, required this.snapshot, required this.widget})
      : super(key: key) {
          // TODO: implement InetWidget
          throw UnimplementedError();
        }

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const Center(
              child: Text('No Intenet'),
            );
          default:
            return widget;
        }
      default:
        return const Text('');
    }
  }
}
