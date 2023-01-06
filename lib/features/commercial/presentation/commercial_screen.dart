import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/pages/commercial_body_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollControllerAll;
  late ScrollController _scrollControllerNew;
  late ScrollController _scrollControllerRidden;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  late TabController tabController;
  double height = 130;
  void _scrollListener() {
    // print('scroll listener trigered ${_scrollController.offset}');
    if (_isShrink) {
      setState(() {
        crossFadeState = CrossFadeState.showSecond;
      });
    } else {
      setState(() {
        crossFadeState = CrossFadeState.showFirst;
      });
    }
  }

  bool get _isShrink =>
      _scrollControllerAll.hasClients &&
      _scrollControllerAll.offset > (height - kToolbarHeight);

  @override
  void initState() {
    _scrollControllerAll = ScrollController()..addListener(_scrollListener);
    _scrollControllerNew = ScrollController();
    _scrollControllerRidden = ScrollController();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollControllerAll
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  final Duration fadeDuration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: SafeArea(
            child: Scaffold(
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    titleSpacing: 1,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    leading: WScaleAnimation(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 16),
                        child: Transform.scale(
                            scale: 1.5,
                            child: SvgPicture.asset(AppIcons.chevronLeft)),
                      ),
                      onTap: () {},
                    ),
                    title: AnimatedCrossFade(
                      duration: fadeDuration,
                      crossFadeState: crossFadeState,
                      firstChild: const Text(
                        'Лёгкий коммерческий транспорт',
                        style: TextStyle(
                            fontSize: 16,
                            color: dark,
                            fontWeight: FontWeight.w600),
                      ),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Mersedes-Benz',
                            style: TextStyle(
                                color: dark,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'sprinter',
                            style: TextStyle(
                                color: grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: WScaleAnimation(
                          onTap:
                              () {} /* => Navigator.push(context, fade(page: const SelectCarScreen()))*/,
                          child: SvgPicture.asset(
                            AppIcons.arrowsSort,
                            color: orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: AnimatedCrossFade(
                      duration: fadeDuration,
                      crossFadeState: crossFadeState,
                      firstChild: CommercialTab(
                        tabController: tabController,
                        tabLabels: const ['Все', 'Новые', 'С пробегом'],
                      ),
                      secondChild: const SizedBox(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          CommercialBodyScreen(
                              scrollController: _scrollControllerAll),
                          CommercialBodyScreen(
                              scrollController: _scrollControllerNew),
                          CommercialBodyScreen(
                              scrollController: _scrollControllerRidden),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: AnimatedContainer(
                alignment: crossFadeState == CrossFadeState.showFirst
                    ? Alignment.center
                    : const Alignment(-.85, 0),
                width: double.maxFinite,
                height: 46,
                duration: fadeDuration,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(22)),
                  width: crossFadeState == CrossFadeState.showFirst ? 221 : 44,
                  height: 44,
                  child: AnimatedCrossFade(
                    duration: const Duration(microseconds: 10),
                    crossFadeState: crossFadeState,
                    firstChild: FittedBox(
                      fit: BoxFit.cover,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Сохранить поиск',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            AppIcons.searchWithHeart,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                    secondChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.searchWithHeart,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
