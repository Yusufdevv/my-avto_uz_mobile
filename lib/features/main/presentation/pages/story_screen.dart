// import 'package:another_transformer_page_view/another_transformer_page_view.dart';
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
  int storyIndex = 0;
  int itemIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc = StoryBloc();
    storyIndex = widget.index;
    pageController = TransformerPageController();
    animationController = AnimationController(vsync: this);

    _loadStory();
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
              _animateToPage(storyIndex);
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
            curve: Curves.easeInBack,
            scrollDirection: Axis.horizontal,
            itemCount: widget.stories.length,
            itemBuilder: (context, index) => Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.stories[index].items[itemIndex].content,
                    imageBuilder: (context, image) => Image(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                    progressIndicatorBuilder: (context, s, progress) {
                      if (progress.totalSize != null &&
                          progress.totalSize != progress.downloaded) {
                        animationController.stop(canceled: false);
                      }
                      if (progress.totalSize == progress.downloaded ||
                          progress.totalSize == null &&
                              progress.downloaded == 0) {
                        _loadStory();
                      }
                      return Expanded(
                        child: Container(
                          color: grey,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage(AppImages.defaultPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 12,
                  left: 16,
                  right: 10,
                  child: Row(
                    children: widget.stories[storyIndex].items
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
                          widget
                              .stories[storyIndex].items[itemIndex].description,
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
                          'description',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: dividerColor),
                        ),
                      ),
                      const SizedBox(height: 28),
                      if (widget
                          .stories[storyIndex].items[itemIndex].url.isNotEmpty)
                        WButton(
                          onTap: () {},
                          text: LocaleKeys.more.tr(),
                          textColor: white,
                          color: white.withOpacity(.2),
                        ),
                    ],
                  ),
                ),
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
                                  .stories[storyIndex].coverImageThumbnail.crop,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Image(
                                image: AssetImage(AppImages.defaultPhoto),
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) => const Image(
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
                          widget.stories[storyIndex].name,
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
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (itemIndex == 0) {
          if (storyIndex == 0) {
            Navigator.pop(context);
          } else {
            storyIndex--;
            itemIndex = widget.stories[storyIndex].items.length - 1;
            _animateToPage(storyIndex);
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
            _animateToPage(storyIndex);
            _loadStory();
          }
        } else {
          itemIndex++;
          _loadStory();
        }
      });
    } else {}
  }

  void _loadStory() {
    animationController
      ..stop()
      ..reset()
      ..duration = const Duration(seconds: 10)
      ..forward();
    if (!widget.stories[storyIndex].items[itemIndex].isRead) {
      bloc.add(ReadEvent(widget.stories[storyIndex].items[itemIndex].id));
    }
  }

  void _animateToPage(int index) {
    pageController.animateToPage(
      storyIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _onLongPress({bool isStopped = true}) {
    if (isStopped) {
      animationController.stop();
    } else {
      animationController.forward();
    }
  }
}
