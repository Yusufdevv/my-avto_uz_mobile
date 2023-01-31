import 'dart:io';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/busy_sheet.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class OptionsItem extends StatefulWidget {
  final String shareUrl;
  final bool isLiked;
  final VoidCallback onTapLike;
  final int countLike;
  final int countShare;
  final int index;

  const OptionsItem({
    required this.shareUrl,
    required this.isLiked,
    required this.onTapLike,
    required this.countLike,
    required this.countShare,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsItem> createState() => _OptionsItemState();
}

class _OptionsItemState extends State<OptionsItem>
    with
        SingleTickerProviderStateMixin,
        // ignore: prefer_mixin
        WidgetsBindingObserver {
  bool isLiked = false;
  int countLike = 0;
  int countShare = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
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
    isLiked = widget.isLiked;
    countLike = widget.countLike;
    countShare = widget.countShare;
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 30,
        child: Column(
          children: [
            WScaleAnimation(
              onTap: () {
                widget.onTapLike();
                if (isLiked) {
                  countLike -= 1;
                } else {
                  countLike += 1;
                }
                isLiked = !isLiked;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    AnimatedSwitcher(
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
                    const SizedBox(height: 2),
                    Text(
                      '$countLike',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            WScaleAnimation(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    SvgPicture.asset(AppIcons.shareWhite),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '$countShare',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                final box = context.findRenderObject() as RenderBox?;
                ShareResult shareResult;
                shareResult = await Share.shareWithResult(widget.shareUrl,
                    sharePositionOrigin:
                        box!.localToGlobal(Offset.zero) & box.size);
                if (shareResult.status == ShareResultStatus.success) {
                  context.read<ReelsBloc>().add(ReelsShare(
                      context.read<ReelsBloc>().state.reels[widget.index].id,
                      widget.index));
                  countShare += 1;
                  setState(() {});
                }
              },
            ),
            WScaleAnimation(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SvgPicture.asset(AppIcons.more),
              ),
              onTap: () {
                Platform.isIOS
                    ? showCupertinoModalPopup(
                        context: context,
                        barrierColor: black.withOpacity(.6),
                        builder: (context) =>
                            BusySheet(copyUrl: widget.shareUrl))
                    : showModalBottomSheet(
                        context: context,
                        //backgroundColor: black.withOpacity(.6),
                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            BusySheet(copyUrl: widget.shareUrl));
              },
            ),
          ],
        ),
      );
}
