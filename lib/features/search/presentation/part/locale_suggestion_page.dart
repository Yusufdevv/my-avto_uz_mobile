import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocaleSuggestionPage extends StatelessWidget {
  LocaleSuggestionPage({Key? key}) : super(key: key);

  List<String> cars = [
    'Gentra 1.5',
    'Nexia 3',
    'Nexia 3',
    'Nexia 3',
  ];


  @override
  Widget build(BuildContext context) =>Container(child: Column(children: [
    Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, bottom: 1),
      color: Theme.of(context)
          .extension<ThemedColors>()!
          .solitudeContainerToDark,
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 4),
      child: Text(
        'Популярные запросы',
        style:
        Theme.of(context).textTheme.headline2!.copyWith(
          fontSize: 13,
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .dolphinToGreySuit,
        ),
      ),
    ),
    ...List.generate(
      cars.length,
          (index) => Container(
        margin: const EdgeInsets.only(bottom: 1),
        width: double.infinity,
        color: Theme.of(context)
            .extension<ThemedColors>()!
            .whiteToDark,
        padding: const EdgeInsets.all(16),
        child: Text(
          cars[index],
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  ],),);
}
