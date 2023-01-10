import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/presentation/pages/ads/ads_body_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AdsScreen extends StatefulWidget {
  final VoidCallback onBack;
  const AdsScreen({super.key, required this.onBack});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late AnnouncementListBloc bloc;
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
    bloc = AnnouncementListBloc(
        useCase: AnnouncementListUseCase(
            repositoryImpl: serviceLocator<AdRepositoryImpl>()))
      ..add(AnnouncementListEvent.getAnnouncementList());
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

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => bloc,
        child: WillPopScope(
          onWillPop: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            BlocProvider.of<GetMakesBloc>(context).add(
              GetMakesBlocEvent.selectedCarItems(
                  id: -1, name: '', imageUrl: ''),
            );
            BlocProvider.of<GetCarModelBloc>(context)
                .add(GetCarModelEvent.selectedModelItem(id: -1, name: ''));
            widget.onBack;
            return true;
          },
          child: KeyboardDismisser(
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
                        leading: Expanded(
                          flex: 1,
                          child: WScaleAnimation(
                            onTap: widget.onBack,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 16),
                              child: Align(
                                alignment: Alignment.center,
                                child: Transform.scale(
                                  scale: 1.5,
                                  child: SvgPicture.asset(AppIcons.chevronLeft),
                                ),
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
                          secondChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (BlocProvider.of<GetMakesBloc>(context)
                                  .state
                                  .name
                                  .isNotEmpty)
                                Text(
                                  BlocProvider.of<GetMakesBloc>(context)
                                      .state
                                      .name,
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
                              if (BlocProvider.of<GetCarModelBloc>(context)
                                  .state
                                  .name
                                  .isNotEmpty)
                                Text(
                                  BlocProvider.of<GetCarModelBloc>(context)
                                      .state
                                      .name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: 12),
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
                              child: Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppIcons.arrowsSort,
                                    color: orange,
                                  ),
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
                                bloc: bloc,
                                scrollController: _scrollController,
                              ),
                              AdsBodyScreen(
                                bloc: bloc,
                                scrollController: _scrollController,
                              ),
                              AdsBodyScreen(
                                bloc: bloc,
                                scrollController: _scrollController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  floatingActionButtonLocation:
                      crossFadeState == CrossFadeState.showFirst
                          ? FloatingActionButtonLocation.centerFloat
                          : FloatingActionButtonLocation.startFloat,
                  floatingActionButton: WScaleAnimation(
                    onTap: () {},
                    child: AnimatedContainer(
                      alignment: crossFadeState == CrossFadeState.showFirst
                          ? Alignment.center
                          : const Alignment(-.85, 0),
                      width:
                          crossFadeState == CrossFadeState.showFirst ? 221 : 44,
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
        ),
      );

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
