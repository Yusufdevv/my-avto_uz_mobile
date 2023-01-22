import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBackButton;
  final VoidCallback? onTapBack;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final String? backgroundAsset;
  final double? bottomRadius;
  final bool filledBackButton;
  final double? topMargin;
  final bool hasUnderline;
  final double? height;
  final Color? underlineColor;
  final bool hasRoundedEnd;
  final Color? roundedEndColor;
  final String textWithButton;
  final Widget? childWithButton;

  final List<BoxShadow>? boxShadow;

  ///Default is 20
  final double backButtonSize;

  ///Default is 8
  final double backTitleBetweenSize;

  ///Default is set true
  final bool centerTitle;

  final Widget? bottom;

  const WAppBar({
    Key? key,
    this.backTitleBetweenSize = 8,
    this.backButtonSize = 20,
    this.bottomRadius,
    this.topMargin,
    this.underlineColor,
    this.hasUnderline = false,
    this.filledBackButton = false,
    this.backgroundAsset,
    this.child,
    this.onTapBack,
    this.backgroundColor,
    this.hasBackButton = true,
    this.title,
    this.titleStyle,
    this.extraActions = const [],
    this.centerTitle = true,
    this.boxShadow,
    this.height,
    this.roundedEndColor,
    this.hasRoundedEnd = false,
    this.textWithButton = '',
    this.childWithButton,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight((height ?? 54) + (hasRoundedEnd ? 20 : 0));

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: (height ?? 52) + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(
                left: filledBackButton ? 16 : 0,
                top: (topMargin ?? 0) + MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 24,
                      color: dark.withOpacity(0.08),
                    ),
                    BoxShadow(
                      offset: const Offset(0, -1),
                      color: dark.withOpacity(0.08),
                    ),
                  ],
              color: backgroundColor ??
                  Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bottomRadius ?? 0),
                bottomRight: Radius.circular(bottomRadius ?? 0),
              ),
              image: backgroundAsset != null && backgroundAsset!.isNotEmpty
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(backgroundAsset!),
                    )
                  : null,
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (hasBackButton)
                      Align(
                        alignment: Alignment.center,
                        child: WScaleAnimation(
                          onTap: onTapBack ??
                              () {
                                Navigator.pop(context);
                              },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                    Container(
                      alignment: Alignment.center,
                      // padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        textWithButton,
                        style: titleStyle ??
                            Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                      ),
                    ),
                    if (childWithButton != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [childWithButton!],
                      ),
                    const Spacer(),
                    ...List.of(extraActions)
                  ],
                ),
                if (child != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [child!],
                  )
                else
                  Row(
                    mainAxisAlignment: centerTitle
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      if (!centerTitle) ...{
                        SizedBox(
                          width: backButtonSize + 16 + backTitleBetweenSize,
                        )
                      },
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          title ?? '',
                          style: titleStyle ??
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
          if (hasRoundedEnd)
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: roundedEndColor ??
                      Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SvgPicture.asset(
                  AppIcons.chevronLeft,
                  width: backButtonSize,
                  height: backButtonSize,
                ),
              ),
            ),
          if (hasUnderline)
            Container(
              height: 1,
              color: underlineColor ?? dividerColor,
            )
          else
            const SizedBox()
        ],
      );
}
