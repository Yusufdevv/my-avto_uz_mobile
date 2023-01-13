// import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'dart:async';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/utils/buildin_transformers.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:auto/features/main/presentation/widgets/animated_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final List<StoryEntity> stories;
  final int index;

  const StoryScreen({
    required this.stories,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late StoryBloc bloc;
  late TransformerPageController pageController;
  late AnimationController animationController;
  late VideoPlayerController videoPlayerController;
  int storyIndex = 0;
  int itemIndex = 0;
  bool isVideo = false;

  @override
  void initState() {
    super.initState();
    bloc = StoryBloc();
    storyIndex = widget.index;
    pageController = TransformerPageController(
        initialPage: storyIndex, itemCount: widget.stories.length);
    animationController = AnimationController(vsync: this);

    final last =
        widget.stories[storyIndex].items[itemIndex].content.split('.').last;
    isVideo = last == 'mp4' || last == 'mov';
    if (isVideo) {
      _loadStory();
    }
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController
          ..stop()
          ..reset();
        setState(() {
          if (itemIndex + 1 == widget.stories[storyIndex].items.length) {
            if (storyIndex + 1 == widget.stories.length) {
              Navigator.pop(context);
            } else {
              itemIndex = 0;
              storyIndex++;
              _animateToPage(forward: true);
              _loadStory();
            }
          } else {
            itemIndex++;
            _loadStory();
          }
        });
      }
    });
    pageController.addListener(() {
      animationController.stop(canceled: false);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    animationController.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: dark,
        body: GestureDetector(
          onLongPress: _onLongPress,
          onLongPressEnd: (e) => _onLongPress(isStopped: false),
          onTapDown: _onTapDown,
          child: TransformerPageView(
            pageController: pageController,
            transformer: ThreeDTransformer(),
            curve: Curves.linear,
            scrollDirection: Axis.horizontal,
            itemCount: widget.stories.length,
            itemBuilder: (context, index) {
              final last =
                  widget.stories[index].items[itemIndex].content.split('.').last;
              final isVideo = last == 'mp4' || last == 'mov';
              if(isVideo) {
                itemIndex = 0;
                storyIndex = index;
                _loadStory();
              }
              print('itemIndex: $itemIndex');
              print('storyIndex: $storyIndex');
              print('index: $index');
              print('isVideo: $isVideo');
              return Stack(
                children: [
                  if (isVideo && videoPlayerController.value.isInitialized)
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: AspectRatio(
                          aspectRatio: videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(
                            videoPlayerController,
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.stories[index].items[itemIndex].content,
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
                              animationController.status !=
                                  AnimationStatus.forward) {
                            _loadStory();
                          }

                          return Container(
                            color: grey,
                          );
                        },
                      ),
                    ),
                  // Positioned(
                  //   top: MediaQuery.of(context).padding.top + 12,
                  //   left: 16,
                  //   right: 10,
                  //   child: Row(
                  //     children: widget.stories[index].items
                  //         .asMap()
                  //         .map(
                  //           (i, e) => MapEntry(
                  //             i,
                  //             AnimatedBar(
                  //               animationController: animationController,
                  //               currentIndex: itemIndex,
                  //               position: i,
                  //             ),
                  //           ),
                  //         )
                  //         .values
                  //         .toList(),
                  //   ),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //           begin: Alignment.bottomCenter,
                  //           end: Alignment.center,
                  //           colors: [dark.withOpacity(1), dark.withOpacity(0)])),
                  // ),
                  // Positioned(
                  //   bottom: MediaQuery.of(context).padding.bottom + 8,
                  //   left: 16,
                  //   right: 16,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 4),
                  //         child: Text(
                  //           widget.stories[index].items[itemIndex].title,
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headline4!
                  //               .copyWith(fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 8),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 4),
                  //         child: Text(
                  //           widget.stories[index].items[itemIndex].description,
                  //           maxLines: 2,
                  //           overflow: TextOverflow.ellipsis,
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .subtitle2!
                  //               .copyWith(
                  //                   fontWeight: FontWeight.w400,
                  //                   color: dividerColor),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 28),
                  //       if (widget.stories[index].items[itemIndex].url.isNotEmpty)
                  //         WButton(
                  //           onTap: () {},
                  //           text: LocaleKeys.more.tr(),
                  //           textColor: white,
                  //           color: white.withOpacity(.2),
                  //         ),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 28,
                    left: 20,
                    right: 16,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                width: 1.5,
                                color: white.withOpacity(.4),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CachedNetworkImage(
                                imageUrl: widget
                                    .stories[index].coverImageThumbnail.crop,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Image(
                                  image: AssetImage(AppImages.defaultPhoto),
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image: AssetImage(AppImages.defaultPhoto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            widget.stories[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                        const Spacer(),
                        WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.closeWhite),
                            onTap: () => Navigator.pop(context))
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    return;
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    print('itemIndex: $itemIndex');
    print('storyIndex: $storyIndex');
    if (dx < screenWidth / 3) {
      setState(() {
        if (itemIndex == 0) {
          if (storyIndex == 0) {
            Navigator.pop(context);
          } else {
            storyIndex--;
            itemIndex = widget.stories[storyIndex].items.length - 1;
            _animateToPage(forward: false);
            _loadStory();
          }
        } else {
          itemIndex--;
          _loadStory();
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (itemIndex + 1 == widget.stories[storyIndex].items.length) {
          if (storyIndex + 1 == widget.stories.length) {
            Navigator.pop(context);
          } else {
            itemIndex = 0;
            storyIndex++;
            _animateToPage(forward: true);
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
    print('itemIndex:1 $itemIndex');
    print('storyIndex:1 $storyIndex');
    final last =
        widget.stories[storyIndex].items[itemIndex].content.split('.').last;
    isVideo = last == 'mp4' || last == 'mov';
    if (isVideo) {
      videoPlayerController = VideoPlayerController.network(
          widget.stories[storyIndex].items[itemIndex].content,
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false))
        ..initialize().then((value) {
          setState(() {});
          videoPlayerController.play();
          animationController
            ..stop()
            ..reset()
            ..duration = videoPlayerController.value.duration
            ..forward();
          if (!widget.stories[storyIndex].items[itemIndex].isRead) {
            bloc.add(ReadEvent(widget.stories[storyIndex].items[itemIndex].id));
          }
        })
        ..setLooping(false);
    } else {
      animationController
        ..stop()
        ..reset()
        ..duration = const Duration(seconds: 1000)
        ..forward();
      if (!widget.stories[storyIndex].items[itemIndex].isRead) {
        bloc.add(ReadEvent(widget.stories[storyIndex].items[itemIndex].id));
      }
    }
  }

  void _initializeVideo() {

  }

  void _animateToPage({required bool forward}) {
    print('animate: $forward');
    forward
        ? pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear)
        : pageController.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
    // pageController.animateToPage(
    //   storyIndex,
    //   duration: const Duration(milliseconds: 500),
    //   curve: forward ? Curves.easeInBack : Curves.easeInOut,
    // );
  }

  void _onLongPress({bool isStopped = true}) {
    if (isStopped) {
      animationController.stop();
    } else {
      animationController.forward();
    }
  }
}
