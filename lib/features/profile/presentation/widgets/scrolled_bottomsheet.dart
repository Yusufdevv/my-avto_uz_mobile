import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrolledBottomSheet extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final Widget? pinnedChild;
  final String title;
  final bool hasHeader;
  final bool escapeBottomNavbar;
  final bool isSubScreen;
  final WButton? stackedWButton;

  const ScrolledBottomSheet(
      {required this.title,
      required this.hasHeader,
      this.escapeBottomNavbar = true,
      this.isSubScreen = false,
      this.child,
      this.children,
      this.pinnedChild,
      this.stackedWButton,
      Key? key})
      : assert(child == null || children == null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          CustomScrollView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              if (hasHeader)
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    height: 64,
                    child: Row(
                      mainAxisAlignment: isSubScreen
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        if (isSubScreen)
                          WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        if (isSubScreen) const SizedBox(width: 4),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        if (!isSubScreen)
                          WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.close),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                      ],
                    ),
                  ),
                )
              else
                const SliverToBoxAdapter(child: SizedBox()),
              if (pinnedChild != null)
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: pinnedChild,
                  ),
                )
              else
                const SliverToBoxAdapter(child: SizedBox()),
              if (child != null)
                SliverFillRemaining(
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: child,
                  ),
                )
              else
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ...children!,
                        if (escapeBottomNavbar)
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom + 8,
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          if (stackedWButton != null)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 8,
              left: 0,
              right: 0,
              child: stackedWButton!,
            )
          else
            const SizedBox(),
        ],
      );
}
