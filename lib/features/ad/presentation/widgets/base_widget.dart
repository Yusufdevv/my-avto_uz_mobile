import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final String headerText;
  final Widget child;
  final EdgeInsets? padding;
  final List<Widget>? extraAction;

  const BaseWidget(
      {required this.headerText,
      required this.child,
      this.extraAction,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    headerText,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  if (extraAction != null) ...{...extraAction!}
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 16),
                padding: padding,
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDark,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20))),
                child: child,
              ),
            ),
          ],
        ),
      );
}
