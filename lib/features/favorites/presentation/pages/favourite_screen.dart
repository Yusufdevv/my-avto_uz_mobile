import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const WAppBar(
          title: 'Избранные',
          centerTitle: false,
        ),
      );
}
