import 'package:flutter/material.dart';

class TitleTextFieldTop extends StatelessWidget {
  const TitleTextFieldTop({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2
          ),
        ),
      );
}
