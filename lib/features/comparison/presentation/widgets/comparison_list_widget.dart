import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class ComparsionList extends StatelessWidget {
  const ComparsionList({Key? key, required this.info, required this.isGrey})
      : super(key: key);

  final String info;
  final bool isGrey;

  @override
  Widget build(BuildContext context) => Container(
        color: isGrey
            ? Theme.of(context)
                .extension<ThemedColors>()!
                .solitudeContainerToNero1
            : Theme.of(context).extension<ThemedColors>()!.whiteToNightRider,
        padding: const EdgeInsets.only(
          left: 16,
          top: 27,
        ),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 54,
        child: Text(
          info,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
      );
}
