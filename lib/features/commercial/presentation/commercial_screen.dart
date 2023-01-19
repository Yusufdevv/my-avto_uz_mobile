import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/pages/commercial_body_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
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
  late ScrollController _scrollController;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  late TabController tabController;
  SortSearchResultStatus? sortingValue = SortSearchResultStatus.cheapest;
  double height = 130;
  void _scrollListener() {
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
      _scrollController.hasClients &&
      _scrollController.offset > (height - kToolbarHeight);

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  final Duration fadeDuration = const Duration(milliseconds: 300);
  final _maxsie = 100;
  double _persent = 0.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (_scrollController.hasClients) {
      if (_scrollController.offset <= 100 && _scrollController.hasClients) {
        final _persen = _scrollController.offset / _maxsie;
        _persent = _persen;
      }
    }
    return KeyboardDismisser(
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
                  titleSpacing: 0,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  leading: WScaleAnimation(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 16),
                      child: Align(
                        alignment: Alignment.center,
                        child: Transform.scale(
                            scale: 1.5,
                            child: SvgPicture.asset(AppIcons.chevronLeft)),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                        onTap: () {
                          filterBottomSheet(context);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppIcons.arrowsSort,
                            color: orange,
                          ),
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
                            scrollController: _scrollController),
                        CommercialBodyScreen(
                            scrollController: _scrollController),
                        CommercialBodyScreen(
                            scrollController: _scrollController),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.startFloat,
            // floatingActionButton: WScaleAnimation(
            //   onTap: () {},
            //   child: AnimatedContainer(
            //     alignment: crossFadeState == CrossFadeState.showFirst
            //         ? const Alignment(-.2, 0)
            //         : const Alignment(-.85, 0),
            //     width: crossFadeState == CrossFadeState.showFirst
            //         ? double.maxFinite
            //         : 44,
            //     height: 44,
            //     duration: fadeDuration,
            //     child: Container(
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           color: orange, borderRadius: BorderRadius.circular(22)),
            //       width: crossFadeState == CrossFadeState.showFirst ? 221 : 44,
            //       height: 44,
            //       child: AnimatedCrossFade(
            //         duration: fadeDuration,
            //         crossFadeState: crossFadeState,
            //         firstChild: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             if (_scrollController.hasClients)
            //               _scrollController.offset <= 70
            //                   ? const FittedBox(
            //                       fit: BoxFit.cover,
            //                       child: Text(
            //                         'Сохранить поиск',
            //                         style: TextStyle(
            //                           fontSize: 14,
            //                           fontWeight: FontWeight.w600,
            //                           color: white,
            //                         ),
            //                       ),
            //                     )
            //                   : const Text('')
            //             else
            //               const Text(
            //                 'Сохранить поиск',
            //                 style: TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w600,
            //                   color: white,
            //                 ),
            //               ),
            //             SvgPicture.asset(
            //               AppIcons.searchWithHeartWhite,
            //             ),
            //           ],
            //         ),
            //         secondChild: SvgPicture.asset(
            //           AppIcons.searchWithHeartWhite,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          
          ),
        ),
      ),
    );
  }

  Future<dynamic> filterBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        backgroundColor: LightThemeColors.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.hardEdge,
        builder: (context) => SortBottomSheet(
          title: 'Сортировка',
          values: const [
            SortSearchResultsModel(
              title: 'По убыванию',
              status: SortSearchResultStatus.cheapest,
            ),
            SortSearchResultsModel(
              title: 'По возрастанию',
              status: SortSearchResultStatus.expensive,
            ),
            SortSearchResultsModel(
              title: 'Сначала старые',
              status: SortSearchResultStatus.oldest,
            ),
            SortSearchResultsModel(
              title: 'Сначала новые',
              status: SortSearchResultStatus.newest,
            ),
          ],
          onChanged: (value) => setState(() => sortingValue = value),
          defaultValue: sortingValue,
        ),
      );
}
