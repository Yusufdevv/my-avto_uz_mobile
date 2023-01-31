import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key, this.isFromMain = false}) : super(key: key);

  final bool isFromMain;

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> with TickerProviderStateMixin {
  late ReelsBloc bloc;
  late PageController _pageController;
  int _currentPage = 0;
  bool _isOnPageTurning = false;

  @override
  void initState() {
    bloc = ReelsBloc()..add(InitialEvent(isFromMain: widget.isFromMain));
    _pageController = PageController(keepPage: true);
    _pageController.addListener(_scrollListener);
    AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
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
        child: SafeArea(
          child: BlocProvider(
            create: (context) => bloc,
            child: BlocBuilder<ReelsBloc, ReelsState>(
              builder: (context, state) => Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    if (state.statusReelsGet.isSubmissionSuccess)
                      PageView.builder(
                        scrollDirection: Axis.vertical,
                        controller: _pageController,
                        itemCount: state.reels.length,
                        itemBuilder: (context, index) => ContentItem(
                          reel: state.reels[index],
                          isLiked: state.reels[index].isLiked,
                          onTapLike: () {
                            bloc.add(ReelsLike(state.reels[index].id, index));
                          },
                          pageIndex: index,
                          currentPageIndex: _currentPage,
                          isPaused: _isOnPageTurning,
                        ),
                      ),
                    Positioned(
                      top: 16,
                      right: 16,
                      left: 16,
                      child: Row(
                        children: [
                          if (widget.isFromMain)
                            WScaleAnimation(
                              child:
                                  SvgPicture.asset(AppIcons.chevronLeftWhite),
                              onTap: () => Navigator.pop(context),
                            ),
                          const Spacer(),
                          SvgPicture.asset(AppIcons.whiteLogo),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void _scrollListener() {
    if (_isOnPageTurning &&
        _pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        _currentPage = _pageController.page!.toInt();
        _isOnPageTurning = false;
        _getMore();
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

  void _getMore() {
    if (_currentPage == bloc.state.reels.length - 1 &&
        !bloc.state.statusReelsGet.isSubmissionInProgress &&
        bloc.state.hasNext) {
      bloc.add(GetMoreReelsEvent(
          isFromMain: widget.isFromMain, offset: bloc.state.reels.length - 1));
    }
  }
}
