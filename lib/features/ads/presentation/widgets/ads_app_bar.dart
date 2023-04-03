import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ads/presentation/widgets/ads_appbar_sliver_delegate.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsAppBar extends StatelessWidget {
  final Duration fadeDuration;
  final CrossFadeState crossFadeState;
  final VoidCallback onSortTap;
  final VoidCallback onBackButtonTap;

  const AdsAppBar(
      {required this.onSortTap,
      required this.fadeDuration,
      required this.crossFadeState,
      required this.onBackButtonTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
        // backgroundColor: Colors.teal,
        titleSpacing: 0,
        pinned: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: WScaleAnimation(
          onTap: onBackButtonTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 16),
            child: Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 1.5,
                child: SvgPicture.asset(AppIcons.chevronLeft),
              ),
            ),
          ),
        ),
        title: AdsAppBarTitle(
          fadeDuration: fadeDuration,
          crossFadeState: crossFadeState,
        ),
        actions: [
          WScaleAnimation(
            onTap: onSortTap,
            child: Container(
              padding:
                  const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppIcons.arrowsSort, color: orange),
            ),
          ),
        ],
      );
}
