// import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/bloc/story_bloc/story_bloc.dart';
import 'package:auto/features/main/presentation/widgets/story_content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  late PageController _pageController;
  int _currentPage = 0;
  bool _isOnPageTurning = false;
  bool didRead = false;

  @override
  void initState() {
    super.initState();
    bloc = StoryBloc();
    _currentPage = widget.index;
    _pageController = PageController(
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: white,
        systemNavigationBarColor: white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: black,
          systemNavigationBarColor: black,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, didRead);
            return false;
          },
          child: Scaffold(
            backgroundColor: dark,
            body: PageView.builder(
              controller: _pageController,
              itemCount: widget.stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => StoryContentItem(
                story: widget.stories[_currentPage],
                pageIndex: index,
                currentPageIndex: _currentPage,
                isPaused: _isOnPageTurning,
                animate: _animateToPage,
                storiesCount: widget.stories.length,
                read: _read,
                didRead: didRead,
              ),
            ),
          ),
        ),
      );

  void _animateToPage({required bool forward}) {
    forward
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear)
        : _pageController.previousPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void _read(int id) {
    didRead = true;
    bloc.add(ReadEvent(id));
  }
}
