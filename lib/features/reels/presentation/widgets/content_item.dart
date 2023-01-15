import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:auto/features/reels/presentation/bloc/player_bloc/video_player_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/options_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class ContentItem extends StatefulWidget {
  final ReelEntity reel;

  const ContentItem({required this.reel, Key? key}) : super(key: key);

  @override
  State<ContentItem> createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem> {
  late VideoPlayerBloc videoPlayerBloc;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    print('widget.reel.content: ${widget.reel.content}');
    videoPlayerBloc = VideoPlayerBloc();
    videoPlayerController = VideoPlayerController.network(widget.reel.content,
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true))
      ..initialize().then((value) {
        videoPlayerBloc.add(InitializeVideoPlayerEvent(
            totalDuration: Duration(
                seconds: videoPlayerController.value.duration.inSeconds)));
      })
      ..setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    videoPlayerBloc.close();
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: videoPlayerBloc,
        child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
          builder: (context, state) => Stack(
            fit: StackFit.expand,
            children: [
              if (videoPlayerController.value.isInitialized)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(
                        videoPlayerController,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [dark.withOpacity(1), dark.withOpacity(0)])),
              ),
              Positioned(
                left: 16,
                bottom: MediaQuery.of(context).padding.bottom + 93,
                child: widget.reel.hasDiscount
                    ? WButton(
                        onTap: () {},
                        padding: const EdgeInsets.fromLTRB(16, 12, 8, 16),
                        borderRadius: 16,
                        //height: 83,
                        color: white.withOpacity(.38),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${MyFunctions.getFormatCost(widget.reel.oldPrice)} ${widget.reel.announcement.currency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: black.withOpacity(.5),
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  '${MyFunctions.getFormatCost(widget.reel.announcement.price)} ${widget.reel.announcement.currency}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: 24, color: dark),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Stack(
                                  children: [
                                    SvgPicture.asset(
                                        AppIcons.discountContainer),
                                    Positioned(
                                      left: 3,
                                      right: 3,
                                      top: 8,
                                      bottom: 8,
                                      child: Text(
                                        '-${widget.reel.discountPercent}%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                // const SizedBox(width: 3),
                                SvgPicture.asset(
                                  AppIcons.chevronRight2,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : WButton(
                        onTap: () {},
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 55,
                        borderRadius: 16,
                        color: purple.withOpacity(.88),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${MyFunctions.getFormatCost(widget.reel.announcement.price)} ${widget.reel.announcement.currency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 24),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(
                              AppIcons.chevronRight2,
                            ),
                          ],
                        ),
                      ),
              ),
              Positioned(
                bottom: 58,
                left: 16,
                child: Text(
                  widget.reel.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 20),
                ),
              ),
              Positioned(
                bottom: 26,
                left: 16,
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: white.withOpacity(.5),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.reel.dealer.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.reel.dealer.name,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: white.withOpacity(.7),
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 11,
                bottom: 31,
                child: OptionsItem(
                  shareUrl: widget.reel.content,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: white.withOpacity(.3),
                    playedColor: white,
                    bufferedColor: white.withOpacity(.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
