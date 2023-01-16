import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/busy_sheet.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class OptionsItem extends StatefulWidget {
  final String shareUrl;
  final bool isLiked;
  final VoidCallback onTapLike;
  final int countLike;
  final int countShare;

  const OptionsItem({
    required this.shareUrl,
    required this.isLiked,
    required this.onTapLike,
    required this.countLike,
    required this.countShare,
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsItem> createState() => _OptionsItemState();
}

class _OptionsItemState extends State<OptionsItem>
    with SingleTickerProviderStateMixin ,WidgetsBindingObserver{

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // bloc.add(GetPaymentEvent(
        //   musofirId: widget.id ?? -1,
        //   transactionId: bloc.state.transactionId,
        // ));
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          WScaleAnimation(
            onTap: widget.onTapLike,
            child: AnimatedSwitcher(
              transitionBuilder: (child, anim) => ScaleTransition(
                scale: anim,
                child: child,
              ),
              duration: const Duration(milliseconds: 300),
              child: widget.isLiked
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
            '${widget.countLike}',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: 20,
          ),
          WScaleAnimation(
              child: SvgPicture.asset(AppIcons.share),
              onTap: () {
                Share.share(widget.shareUrl);
              }),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${widget.countShare}',
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
