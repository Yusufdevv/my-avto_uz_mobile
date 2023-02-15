import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class TitleTextFieldTop extends StatelessWidget {
  const TitleTextFieldTop({required this.title, this.isRequired = false});

  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.displayMedium),
              if (isRequired)
                Text('*',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: orange)),
            ],
          ),
        ),
      );
}
