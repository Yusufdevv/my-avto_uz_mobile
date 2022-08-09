import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/reels/domain/entities/content_entity.dart';
import 'package:auto/features/reels/presentation/bloc/video_player_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/options_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class ContentItem extends StatefulWidget {
  final ContentEntity contentEntity;

  const ContentItem({required this.contentEntity, Key? key}) : super(key: key);

  @override
  State<ContentItem> createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem> {
  late VideoPlayerBloc videoPlayerBloc;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerBloc = VideoPlayerBloc();
    videoPlayerController = VideoPlayerController.network(
        widget.contentEntity.url,
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
                bottom: 102,
                child: widget.contentEntity.isDiscount
                    ? WButton(
                        onTap: () {},
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        borderRadius: 16,
                        height: 81,
                        color: white.withOpacity(.38),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${MyFunctions.getFormatCost(widget.contentEntity.oldPrice)} UZS',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: black.withOpacity(.5),
                                  ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${MyFunctions.getFormatCost(widget.contentEntity.price)} UZS',
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
                                        '-${widget.contentEntity.discountPercent}%',
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
                                SvgPicture.asset(
                                  AppIcons.chevronRight,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : WButton(
                        onTap: () {},
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        height: 55,
                        borderRadius: 16,
                        color: purple.withOpacity(.88),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${MyFunctions.getFormatCost(widget.contentEntity.price)} UZS',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 22),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(
                              AppIcons.chevronRight,
                            ),
                          ],
                        ),
                      ),
              ),
              Positioned(
                bottom: 58,
                left: 16,
                child: Text(
                  widget.contentEntity.carName,
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
                          widget.contentEntity.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.contentEntity.companyName,
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
                  shareUrl: widget.contentEntity.url,
                ),
              ),
              Positioned(
                bottom: 5,
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
