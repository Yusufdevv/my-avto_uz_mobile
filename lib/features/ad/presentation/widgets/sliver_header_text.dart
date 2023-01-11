import 'package:flutter/material.dart';

class SliverHeaderText extends StatelessWidget {
  final String text;

  const SliverHeaderText({required this.text, super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
}
