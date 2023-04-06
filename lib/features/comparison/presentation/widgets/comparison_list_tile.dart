import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class ComparisionListTile extends StatelessWidget {
  const ComparisionListTile({
    required this.info,
    required this.isGrey,
    required this.width,
    Key? key,
  }) : super(key: key);

  final String info;
  final double width;
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
        width: width,
        height: 54,
        child: Row(
          children: [
            Expanded(
              child: Text(
                info,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600, color:Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                    ),
              ),
            ),
          ],
        ),
      );
}
