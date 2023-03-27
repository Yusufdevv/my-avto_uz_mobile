import 'dart:async';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({
    Key? key,
    this.isForOfferDay = false,
  }) : super(key: key);

  final bool isForOfferDay;

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen>
    with TickerProviderStateMixin {
  late ReelsBloc bloc;
  late PageController _pageController;
  Timer? timer;
  int _currentPage = 0;
  bool _isOnPageTurning = false;
  double topMin = 60;
  double topMax = 110;
  double right = 0;
  double left = 0;
  int timeInSec = 1;
  int count = 0;
  bool isIncreasing = false;
  bool isFirstTimeWatchReel = true;

  @override
  void initState() {
    bloc = ReelsBloc()..add(InitialEvent(isForOfferDay: widget.isForOfferDay));
    _pageController = PageController(keepPage: true);
    _pageController.addListener(_scrollListener);
    isFirstTimeWatchReel = StorageRepository.getBool(
      StorageKeys.FIRST_TIME_WATCH_REEL,
      defValue: true,
    );
    if (isFirstTimeWatchReel) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (count ~/ timeInSec % 2 == 0) {
            isIncreasing = true;
          } else {
            isIncreasing = false;
          }
        });
        count++;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
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
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, state) => CustomScreen(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
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
                          videoEnded: () {
                            if (index == state.reels.length - 1 &&
                                !state.hasNext) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 16,
                      right: 16,
                      left: 16,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.chevronLeftWhite),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          const Spacer(),
                          SvgPicture.asset(AppIcons.whiteLogo),
                        ],
                      ),
                    ),
                    if (isFirstTimeWatchReel)
                      AnimatedPositioned(
                        top: isIncreasing ? topMax : topMin,
                        left: 0,
                        right: 0,
                        duration: Duration(seconds: timeInSec),
                        child: SvgPicture.asset(AppIcons.introduce),
                      ),
                    if (isFirstTimeWatchReel)
                      AnimatedPositioned(
                        bottom: (isIncreasing ? topMax : topMin) + 100,
                        left: 0,
                        right: 0,
                        duration: Duration(seconds: timeInSec),
                        child: SvgPicture.asset(AppIcons.introduce1),
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
        isFirstTimeWatchReel = false;
        StorageRepository.putBool(
            key: StorageKeys.FIRST_TIME_WATCH_REEL, value: false);
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
          isForOfferDay: widget.isForOfferDay,
          offset: bloc.state.reels.length - 1));
    }
  }
}
