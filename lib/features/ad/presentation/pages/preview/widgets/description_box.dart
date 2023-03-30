import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  final String? description;

  const DescriptionBox({required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (description == null || (description?.isEmpty ?? true)) {
      return const SizedBox();
    }
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .extension<ThemedColors>()!
            .whiteToDark,
          border: Border.symmetric(
              horizontal:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Комментарий',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            description!,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
