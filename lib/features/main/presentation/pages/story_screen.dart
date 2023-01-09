// import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:auto/features/main/presentation/widgets/animated_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    pageController = TransformerPageController(
        itemCount: widget.stories.length, initialPage: storyIndex);
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
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.stories.length,
            itemBuilder: (context, index) {
              print('itemBuilder index : $index');
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
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
                        return Container(color: grey);
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
                      children: widget.stories[index].items
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
                ],
              );
            },
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
      ..duration = const Duration(seconds: 5)
      ..forward();
    if (!widget.stories[storyIndex].items[itemIndex].isRead) {
      bloc.add(ReadEvent(widget.stories[storyIndex].items[itemIndex].id));
    }
  }

  void  _animateToPage(int index) {
    print('animate index: $index');
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInBack,
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
