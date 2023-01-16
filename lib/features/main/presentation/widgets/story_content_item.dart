import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/widgets/animated_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StoryContentItem extends StatefulWidget {
  const StoryContentItem({
    required this.story,
    required this.pageIndex,
    required this.currentPageIndex,
    required this.isPaused,
    required this.animate,
    required this.storiesCount,
    required this.read,
    Key? key,
  }) : super(key: key);

  final StoryEntity story;
  final int pageIndex;
  final int currentPageIndex;
  final bool isPaused;
  final int storiesCount;
  final Function({required bool forward}) animate;
  final Function(int id) read;

  @override
  State<StoryContentItem> createState() => _StoryContentItemState();
}

class _StoryContentItemState extends State<StoryContentItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late AnimationController animationController;
  int itemIndex = 0;
  bool isVideo = false;
  bool initialized = false;
  bool actualDisposed = false;
  bool isEnded = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animationController.addStatusListener(_animationListener);
    _loadStory();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape = false;
    _pauseAndPlayVideo();
    if (initialized && _videoPlayerController.value.isInitialized) {
      isLandscape = _videoPlayerController.value.size.width >
          _videoPlayerController.value.size.height;
    }
    return GestureDetector(
      onLongPress: _onLongPress,
      onLongPressEnd: (e) => _onLongPress(isStopped: false),
      onTapDown: _onTapDown,
      child: Stack(
        children: [
          if (isVideo && initialized)
            isLandscape ? _renderLandscapeVideo() : _renderPortraitVideo()
          else
            Container(),
          if (!isVideo)
            SizedBox(
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: widget.story.items[itemIndex].content,
                imageBuilder: (context, image) => Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
                progressIndicatorBuilder: (context, s, progress) {
                  if (progress.totalSize != null &&
                      progress.totalSize != progress.downloaded) {
                    animationController.stop(canceled: false);
                  }
                  if ((progress.totalSize == progress.downloaded ||
                          progress.totalSize == null &&
                              progress.downloaded == 0) &&
                      animationController.status != AnimationStatus.forward) {
                    _loadStory();
                  }

                  return Container(
                    color: grey,
                  );
                },
              ),
            ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            right: 10,
            child: Row(
              children: widget.story.items
                  .asMap()
                  .map(
                    (i, e) => MapEntry(
                      i,
                      AnimatedBar(
                        animationController: animationController,
                        currentIndex: itemIndex,
                        position: i,
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [dark.withOpacity(1), dark.withOpacity(0)])),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 8,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.story.items[itemIndex].title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.story.items[itemIndex].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400, color: dividerColor),
                  ),
                ),
                const SizedBox(height: 28),
                if (widget.story.items[itemIndex].url.isNotEmpty)
                  WButton(
                    onTap: () {},
                    text: LocaleKeys.more.tr(),
                    textColor: white,
                    color: white.withOpacity(.2),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController
        ..stop()
        ..reset();
      setState(() {
        if (itemIndex + 1 == widget.story.items.length) {
          if (widget.currentPageIndex + 1 == widget.storiesCount) {
            Navigator.pop(context);
          } else {
            itemIndex = 0;
            widget.animate(forward: true);
            _loadStory();
          }
        } else {
          itemIndex++;
          _loadStory();
        }
      });
    }
  }

  void _onTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (itemIndex == 0) {
          if (widget.currentPageIndex == 0) {
            Navigator.pop(context);
          } else {
            itemIndex = widget.story.items.length - 1;
            widget.animate(forward: false);
            _loadStory();
          }
        } else {
          itemIndex--;
          _loadStory();
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (itemIndex + 1 == widget.story.items.length) {
          if (widget.currentPageIndex + 1 == widget.storiesCount) {
            Navigator.pop(context);
          } else {
            itemIndex = 0;
            widget.animate(forward: true);
            _loadStory();
          }
        } else {
          itemIndex++;
          _loadStory();
        }
      });
    }
  }

  void _loadStory() {
    print('loadStory: ${widget.currentPageIndex} $itemIndex');
    final last = widget.story.items[itemIndex].content.split('.').last;
    isVideo = last == 'mp4' || last == 'mov';
    if (isVideo) {
      _initVideoController();
    } else {
      animationController
        ..stop()
        ..reset()
        ..duration = const Duration(seconds: 10)
        ..forward();
      if (!widget.story.items[itemIndex].isRead) {
        widget.read(widget.story.items[itemIndex].id);
      }
    }
  }

  void _onLongPress({bool isStopped = true}) {
    if (isStopped) {
      animationController.stop();
    } else {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    if (initialized) {
      _videoPlayerController
        ..removeListener(_videoListener)
        ..dispose();
    }

    actualDisposed = true;
    super.dispose();
  }

  void _initVideoController() {
    _videoPlayerController =
        VideoPlayerController.network(widget.story.items[itemIndex].content);
    _videoPlayerController.addListener(_videoListener);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.setLooping(false);
        initialized = true;
      });
    });
  }

  void _videoListener() {
    if (!initialized) return;

    if (_videoPlayerController.value.position >=
        _videoPlayerController.value.duration) {
      // on video end
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
