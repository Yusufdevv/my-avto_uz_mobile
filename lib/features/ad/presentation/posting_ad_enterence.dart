import 'package:auto/features/ad/presentation/bloc/pae_bloc/pae_bloc.dart';
import 'package:auto/features/ad/presentation/posting_ad_screen.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostingAddEnterance extends StatefulWidget {
  final BuildContext parentContext;
  const PostingAddEnterance({required this.parentContext, super.key});

  @override
  State<PostingAddEnterance> createState() => _PostingAddEnteranceState();
}

class _PostingAddEnteranceState extends State<PostingAddEnterance> {
  late PaeBloc paeBloc;
  @override
  void initState() {
    paeBloc = PaeBloc()..add(PaeGoToEvent(goTo: true));

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: paeBloc,
        child: BlocConsumer<PaeBloc, PaeState>(
          listener: (context, state) {
            if (state.goTo) {
              Navigator.of(context, rootNavigator: true)
                  .push(fade(page: const PostingAdScreen()))
                  .then((value) {
                print(
                    '=> => => => came back from posting ad: $value    <= <= <= <=');
                if (value ?? false) {
                  HomeTabControllerProvider.of(widget.parentContext)
                      .controller
                      .animateTo(4);
                }
              });
            }
          },
          builder: (context, state) => const Scaffold(
            body: Center(child: CupertinoActivityIndicator()),
          ),
        ),
      );
}
