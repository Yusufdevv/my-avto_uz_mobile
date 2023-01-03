import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class WBottomSheet extends StatelessWidget {
  final double borderRadius;
  final List<Widget> children;
  final Widget? bottomNavigation;
  final double? height;
  final EdgeInsets? contentPadding;
  final Color? bottomsheetBackground;
  const WBottomSheet({
    required this.children,
    this.borderRadius = 16,
    this.height,
    this.bottomNavigation,
    this.contentPadding,
    this.bottomsheetBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: bottomsheetBackground ?? white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
              ),
              padding: contentPadding ??
                  EdgeInsets.fromLTRB(
                    20,
                    16,
                    20,
                    bottomNavigation == null
                        ? MediaQuery.of(context).padding.bottom + 16
                        : 0,
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
            if (bottomNavigation != null) ...{
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                ),
                child: bottomNavigation,
              ),
            }
          ],
        ),
      );
}
