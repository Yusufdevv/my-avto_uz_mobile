import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:auto/features/reels/presentation/widgets/content_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late ReelsBloc bloc;
  late PageController _pageController;
  int _currentPage = 0;
  bool _isOnPageTurning = false;

  @override
  void initState() {
    bloc = ReelsBloc()..add(InitialEvent());
    _pageController = PageController(keepPage: true);
    _pageController.addListener(_scrollListener);
    super.initState();
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
  Widget build(BuildContext context) => SafeArea(
        child: BlocProvider(
          create: (context) => bloc,
          child: BlocBuilder<ReelsBloc, ReelsState>(
            builder: (context, state) {
              print('state: ${state.reels}');
              return Scaffold(
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
                          WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.chevronLeftWhite),
                            onTap: () => Navigator.pop(context),
                          ),
                          const Spacer(),
                          SvgPicture.asset(AppIcons.whiteLogo),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
