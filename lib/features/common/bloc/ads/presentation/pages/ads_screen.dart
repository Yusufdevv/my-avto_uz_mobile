import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/ads/presentation/pages/ads_body_screen.dart';
import 'package:auto/features/common/bloc/ads/presentation/widgets/ads_appbar_sliver_delegate.dart';
import 'package:auto/features/common/bloc/ads/presentation/widgets/ads_sliver_deleget.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdsScreen extends StatefulWidget {
  final bool isBack;
  final VoidCallback onTap;
  const AdsScreen({
    required this.isBack,
    required this.onTap,
    super.key,
  });

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  SortSearchResultStatus? sortingValue = SortSearchResultStatus.cheapest;
  late ScrollController _scrollController;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  GlobalKey key = GlobalKey();
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
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      builder: (context, state) => SafeArea(
        child: CustomScreen(
          child: Scaffold(
            body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  titleSpacing: 0,
                  pinned: true,
                  elevation: 0,
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
                  title: AdsAppBarTitle(
                    fadeDuration: fadeDuration,
                    crossFadeState: crossFadeState,
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
                SliverPersistentHeader(
                  delegate: AdsSliverWidget(
                    size: size,
                    theme: theme,
                    tabController: tabController,
                  ),
                ),
              ],
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  AdsBodyScreen(
                    isNew: null,
                  ),
                  AdsBodyScreen(
                    isNew: true,
                  ),
                  AdsBodyScreen(
                    isNew: false,
                  ),
                ],
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
