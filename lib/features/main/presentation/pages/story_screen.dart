// import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/utils/buildin_transformers.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:auto/features/main/presentation/widgets/story_content_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _StoryScreenState extends State<StoryScreen> {
  late StoryBloc bloc;
  late TransformerPageController _pageController;
  int _currentPage = 0;
  bool _isOnPageTurning = false;

  @override
  void initState() {
    super.initState();
    bloc = StoryBloc();
    _currentPage = widget.index;
    _pageController = TransformerPageController(
      initialPage: _currentPage,
      keepPage: true,
    );
    _pageController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_isOnPageTurning &&
        _pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        _currentPage = _pageController.page!.toInt();
        _isOnPageTurning = false;
      });
    } else if (!_isOnPageTurning &&
        _currentPage.toDouble() != _pageController.page) {
      if ((_currentPage.toDouble() - _pageController.page!).abs() > 0.7) {
        setState(() {
          _isOnPageTurning = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: dark,
        body: Stack(
          children: [
            TransformerPageView(
              pageController: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              transformer: ThreeDTransformer(),
              curve: Curves.linear,
              itemCount: widget.stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => StoryContentItem(
                story: widget.stories[index],
                pageIndex: index,
                currentPageIndex: _currentPage,
                isPaused: _isOnPageTurning,
                animate: _animateToPage,
                storiesCount: widget.stories.length,
                read: _read,
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
                              .stories[_currentPage].coverImageThumbnail.crop,
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
                      widget.stories[_currentPage].name,
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
      );

  void _animateToPage({required bool forward}) {
    print('animate: $forward');
    forward
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear)
        : _pageController.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void _read(int id) {
    bloc.add(ReadEvent(id));
  }
}
