import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/busy_sheet.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class OptionsItem extends StatelessWidget {
  final String shareUrl;
  final bool isLiked;
  final VoidCallback onTap;
  final int countLike;
  final int countShare;

  const OptionsItem({
    required this.shareUrl,
    required this.isLiked,
    required this.onTap,
    required this.countLike,
    required this.countShare,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          WScaleAnimation(
            onTap: onTap,
            child: AnimatedSwitcher(
              transitionBuilder: (child, anim) => ScaleTransition(
                scale: anim,
                child: child,
              ),
              duration: const Duration(milliseconds: 300),
              child: isLiked
                  ? SvgPicture.asset(
                      AppIcons.liked,
                      key: const ValueKey<int>(1),
                      width: 28,
                      height: 28,
                    )
                  : SvgPicture.asset(
                      AppIcons.like,
                      key: const ValueKey<int>(2),
                      width: 28,
                      height: 28,
                    ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '$countLike',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 20,
          ),
          WScaleAnimation(
              child: SvgPicture.asset(AppIcons.share),
              onTap: () {
                Share.share(shareUrl);
              }),
          const SizedBox(
            height: 2,
          ),
          Text(
            '$countShare',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 20,
          ),
          WScaleAnimation(
            child: SvgPicture.asset(AppIcons.more),
            onTap: () {
              Platform.isIOS
                  ? showCupertinoModalPopup(
                      context: context,
                      barrierColor: black.withOpacity(.6),
                      builder: (context) => const BusySheet())
                  : showModalBottomSheet(
                      context: context,
                      //backgroundColor: black.withOpacity(.6),
                      backgroundColor: Colors.transparent,
                      builder: (context) => const BusySheet());
            },
          ),
        ],
      );
}
