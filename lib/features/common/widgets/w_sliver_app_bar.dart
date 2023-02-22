import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WSliverAppBar extends StatelessWidget {
  final bool hasBackButton;
  final String? title;
  final Widget? child;
  final Widget? icon;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final double? height;
  final double? topMargin;
  final List<BoxShadow>? boxShadow;
  final double? bottomRadius;
  final String? backgroundAsset;

  ///Default is set true
  final bool centerTitle;

  const WSliverAppBar({
    this.title,
    this.topMargin,
    this.height,
    this.bottomRadius,
    this.backgroundAsset,
    this.boxShadow,
    this.backgroundColor,
    this.child,
    this.extraActions = const [],
    this.centerTitle = true,
    this.titleStyle,
    this.hasBackButton = true,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        floating: true,
        snap: false,
        stretch: false,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.red,
        expandedHeight: 93,
        title: const SizedBox(),
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            height: (height ?? 52) + MediaQuery.of(context).padding.top,
            padding: EdgeInsets.only(
                left: 0,
                top: (topMargin ?? 12) + MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasBackButton)
                      Align(
                        alignment: Alignment.center,
                        child: WScaleAnimation(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                    const SizedBox(width: 8),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title ?? '',
                        style: titleStyle ??
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    const Spacer(),
                    WScaleAnimation(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: icon,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [child!],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
