import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/busy_sheet.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/video_player_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class OptionsItem extends StatefulWidget {
  final String shareUrl;
  const OptionsItem({required this.shareUrl, Key? key}) : super(key: key);

  @override
  State<OptionsItem> createState() => _OptionsItemState();
}

class _OptionsItemState extends State<OptionsItem> {
  late VideoPlayerBloc videoPlayerBloc;

  @override
  void initState() {
    videoPlayerBloc = VideoPlayerBloc();
    super.initState();
  }

  bool isLiked = false;
  bool clicked = true;
  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: videoPlayerBloc,
        child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
          builder: (context, state) => Column(
            children: [
              WScaleAnimation(
                onTap: clicked
                    ? () {
                        setState(() {
                          isLiked = true;
                          clicked = false;
                          context.read<VideoPlayerBloc>().add(
                              GetTotalLikes(incrementLikes: state.totalLikes));
                        });
                      }
                    : () {},
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
                '${state.totalLikes}',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 12),
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
                '56',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              WScaleAnimation(
                  child: SvgPicture.asset(AppIcons.more),
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        barrierColor: black.withOpacity(.6),
                        builder: (context) => const BusySheet());
                  }),
            ],
          ),
        ),
      );
}
