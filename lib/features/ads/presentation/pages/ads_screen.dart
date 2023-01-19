import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/ads_body_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AdsScreen extends StatefulWidget {
  final bool isBack;
  final VoidCallback onTap;
  const AdsScreen({super.key, required this.isBack, required this.onTap});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  SortSearchResultStatus? sortingValue = SortSearchResultStatus.cheapest;

  late ScrollController _scrollController;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  double height = 140;
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
    context.read<AnnouncementListBloc>().add(AnnouncementListEvent.getIsHistory(
        context.read<GetMakesBloc>().state.selectId <= 0));
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
  double _persent = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (_scrollController.hasClients) {
      if (_scrollController.offset <= 100 && _scrollController.hasClients) {
        final _persen = _scrollController.offset / _maxsie;
        _persent = _persen;
      }
    }
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      builder: (context, state) => KeyboardDismisser(
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
                      onTap: widget.isBack
                          ? widget.onTap
                          : () {
                              Navigator.pop(context);
                            },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 16),
                        child: Align(
                          alignment: Alignment.center,
                          child: Transform.scale(
                            scale: 1.5,
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                        ),
                      ),
                    ),
                    title: AnimatedCrossFade(
                      duration: fadeDuration,
                      crossFadeState: crossFadeState,
                      firstChild: const Text(
                        'Объявления',
                        style: TextStyle(
                            fontSize: 16,
                            color: dark,
                            fontWeight: FontWeight.w600),
                      ),
                      secondChild: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (context
                                .read<GetMakesBloc>()
                                .state
                                .name
                                .isNotEmpty)
                              Text(
                                '${context.read<GetMakesBloc>().state.name}  ${context.read<GetCarModelBloc>().state.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 16),
                              )
                            else
                              Text(
                                'Выберите марку и модель',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 16),
                              ),
                            if (context
                                .read<GetMakesBloc>()
                                .state
                                .name
                                .isNotEmpty)
                              Text(
                                '${context.read<AnnouncementListBloc>().state.count} ${LocaleKeys.offers.tr()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: grey,
                                    ),
                              )
                          ],
                        ),
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
                          AdsBodyScreen(
                            scrollController: _scrollController,
                            isNew: null,
                          ),
                          AdsBodyScreen(
                            scrollController: _scrollController,
                            isNew: true,
                          ),
                          AdsBodyScreen(
                            scrollController: _scrollController,
                            isNew: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: state.isHistory
                  ? const SizedBox()
                  : WScaleAnimation(
                      onTap: () {
                        context
                            .read<AnnouncementListBloc>()
                            .add(AnnouncementListEvent.getIsHistory(true));
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        alignment: crossFadeState == CrossFadeState.showFirst
                            ? const Alignment(-.2, 0)
                            : const Alignment(-.85, 0),
                        width: crossFadeState == CrossFadeState.showFirst
                            ? double.maxFinite
                            : 44,
                        height: 44,
                        duration: fadeDuration,
                        child: Container(
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(22)),
                          width: crossFadeState == CrossFadeState.showFirst
                              ? 221
                              : 44,
                          height: 44,
                          child: AnimatedCrossFade(
                            alignment: Alignment.center,
                            duration: fadeDuration,
                            crossFadeState: crossFadeState,
                            firstChild: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_scrollController.hasClients)
                                    _scrollController.offset <= 70
                                        ? const FittedBox(
                                            fit: BoxFit.cover,
                                            child: Text(
                                              'Сохранить поиск',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: white,
                                              ),
                                            ),
                                          )
                                        : const Text('')
                                  else
                                    const Text(
                                      'Сохранить поиск',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: white,
                                      ),
                                    ),
                                  SvgPicture.asset(
                                    AppIcons.searchWithHeartWhite,
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            secondChild: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 12),
                              child: SvgPicture.asset(
                                AppIcons.searchWithHeartWhite,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
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
