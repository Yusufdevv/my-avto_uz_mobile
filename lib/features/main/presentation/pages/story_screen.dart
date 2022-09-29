import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/domain/entities/story_enrtity.dart';
import 'package:auto/features/main/presentation/widgets/animated_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryScreen extends StatefulWidget {
  final List<StoryEntity> story;

  const StoryScreen({required this.story, Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animationController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    animationController = AnimationController(vsync: this);

    final firstStory = widget.story.first;
    _loadStory(story: firstStory, animateToPage: false);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController
          ..stop()
          ..reset();
        setState(() {
          if (currentIndex + 1 < widget.story.length) {
            currentIndex += 1;
            _loadStory(story: widget.story[currentIndex]);
          } else if (currentIndex == widget.story.length - 1) {
            Navigator.pop(context);
          } else {
            currentIndex = 0;
            _loadStory(story: widget.story[currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.story[currentIndex];
    return Scaffold(
      body: GestureDetector(
        onLongPress: _onLongPress,
        onLongPressEnd: (e) => _onLongPress(isStopped: false),
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final storyEntity = widget.story[index];
                return CachedNetworkImage(
                  imageUrl: storyEntity.url,
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 12,
              left: 16,
              right: 10,
              child: Row(
                children: widget.story
                    .asMap()
                    .map(
                      (i, e) => MapEntry(
                        i,
                        AnimatedBar(
                          animationController: animationController,
                          currentIndex: currentIndex,
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
                      story.storyItemEntity.descriptionTitle,
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
                      story.storyItemEntity.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w400, color: dividerColor),
                    ),
                  ),
                  const SizedBox(height: 28),
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
                          imageUrl: story.storyItemEntity.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      story.storyItemEntity.title,
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
    );
  }

  void _onTapDown(TapDownDetails details, StoryEntity story) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (currentIndex - 1 >= 0) {
          currentIndex -= 1;
          _loadStory(story: widget.story[currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (currentIndex + 1 < widget.story.length + 1) {
          currentIndex += 1;
          if(currentIndex == widget.story.length){
            Navigator.pop(context);
          }
          _loadStory(story: widget.story[currentIndex]);
        }else {
          currentIndex = 0;
          _loadStory(story: widget.story[currentIndex]);
        }

      });
    } else {}
  }

  void _loadStory({required StoryEntity story, bool animateToPage = true}) {
    animationController
      ..stop()
      ..reset()
      ..duration = story.duration
      ..forward();
    if (animateToPage) {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    }
  }

  void _onLongPress({bool isStopped = true}) {
    if (isStopped) {
      animationController.stop();
    } else {
      animationController.forward();
    }
  }
}
