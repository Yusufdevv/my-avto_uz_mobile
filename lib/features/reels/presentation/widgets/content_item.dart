import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:auto/features/reels/presentation/widgets/options_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContentItem extends StatefulWidget {
  final ReelEntity reel;
  final VoidCallback onTapLike;
  final int pageIndex;
  final int currentPageIndex;
  final bool isPaused;
  final bool loop;
  final bool autoPlayNextVideo;
  final void Function()? videoEnded;

  const ContentItem({
    required this.reel,
    required this.onTapLike,
    required this.pageIndex,
    required this.currentPageIndex,
    required this.isPaused,
    Key? key,
    this.videoEnded,
    this.loop = false,
    this.autoPlayNextVideo = false,
  }) : super(key: key);

  @override
  State<ContentItem> createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem> {
  late VideoPlayerController _videoPlayerController;
  bool initialized = false;
  bool actualDisposed = false;
  bool isEnded = false;

  @override
  void initState() {
    super.initState();
    _initVideoController();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape = false;
    _pauseAndPlayVideo();
    if (initialized && _videoPlayerController.value.isInitialized) {
      isLandscape = _videoPlayerController.value.size.width >
          _videoPlayerController.value.size.height;
    }
    return Stack(
      // fit: StackFit.expand,
      children: [
        if (initialized)
          isLandscape ? _renderLandscapeVideo() : _renderPortraitVideo()
        else
          Container(),
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
                        '${MyFunctions.getFormatCost(widget.reel.oldPrice)} '
                        '${widget.reel.announcement.currency}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: black.withOpacity(.5),
                            ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            '${MyFunctions.getFormatCost(widget.reel.announcement.price)} '
                            '${widget.reel.announcement.currency}',
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
                              SvgPicture.asset(AppIcons.discountContainer),
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
                        '${MyFunctions.getFormatCost(widget.reel.announcement.price)} '
                        '${widget.reel.announcement.currency}',
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
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20),
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
            onTap: widget.onTapLike,
            isLiked: widget.reel.isLiked,
            countLike: widget.reel.likeCount,
            countShare: widget.reel.shareCount,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(
            _videoPlayerController,
            allowScrubbing: true,
            colors: VideoProgressColors(
              backgroundColor: white.withOpacity(.3),
              playedColor: white,
              bufferedColor: white.withOpacity(.3),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (initialized) {
      _videoPlayerController
        ..removeListener(_videoListener)
        ..dispose();
    }

    actualDisposed = true;
    super.dispose();
  }

  void _initVideoController() {
    _videoPlayerController = VideoPlayerController.network(widget.reel.content);
    _videoPlayerController.addListener(_videoListener);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.setLooping(widget.loop);
        initialized = true;
      });
    });
  }

  void _videoListener() {
    if (!initialized) return;

    if (_videoPlayerController.value.position >=
        _videoPlayerController.value.duration) {
      if (widget.autoPlayNextVideo && widget.videoEnded != null && !isEnded) {
        isEnded = true;
        widget.videoEnded!();
      }
    }
  }

  void _pauseAndPlayVideo() {
    if (initialized) {
      if (widget.pageIndex == widget.currentPageIndex &&
          !widget.isPaused &&
          initialized) {
        _videoPlayerController.play().then((value) {});
      } else {
        _videoPlayerController.pause().then((value) {});
      }
    }
  }

  Widget _renderLandscapeVideo() {
    if (!initialized) return Container();
    return Center(
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VisibilityDetector(
            onVisibilityChanged: _handleVisibilityDetector,
            key: Key('key_${widget.currentPageIndex}'),
            child: VideoPlayer(_videoPlayerController)),
      ),
    );
  }

  Widget _renderPortraitVideo() {
    if (!initialized) return Container();

    var tmp = MediaQuery.of(context).size;

    final screenH = max(tmp.height, tmp.width);
    final screenW = min(tmp.height, tmp.width);
    tmp = _videoPlayerController.value.size;

    final previewH = max(tmp.height, tmp.width);
    final previewW = min(tmp.height, tmp.width);
    final screenRatio = screenH / screenW;
    final previewRatio = previewH / previewW;

    return Center(
      child: OverflowBox(
        maxHeight: screenRatio > previewRatio
            ? screenH
            : screenW / previewW * previewH,
        maxWidth: screenRatio > previewRatio
            ? screenH / previewH * previewW
            : screenW,
        child: VisibilityDetector(
            onVisibilityChanged: _handleVisibilityDetector,
            key: Key('key_${widget.currentPageIndex}'),
            child: VideoPlayer(_videoPlayerController)),
      ),
    );
  }

  void _handleVisibilityDetector(VisibilityInfo info) {
    if (info.visibleFraction == 0) {
      if (!actualDisposed &&
          widget.pageIndex == widget.currentPageIndex &&
          !widget.isPaused &&
          initialized) {
        _videoPlayerController.pause().then((value) {});
      }
    } else {
      _videoPlayerController.play().then((value) {});
    }
  }
}
