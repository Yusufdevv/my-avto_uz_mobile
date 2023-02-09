import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/ads_body_screen.dart';
import 'package:auto/features/ads/presentation/widgets/ads_appbar_sliver_delegate.dart';
import 'package:auto/features/ads/presentation/widgets/ads_sliver_deleget.dart';
import 'package:auto/features/ads/presentation/widgets/filter_bottom_sheet.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../profile/presentation/bloc/profile/profile_bloc.dart';

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
    if (context.read<RegionsBloc>().state.regions.isEmpty) {
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    }
    context
        .read<AnnouncementListBloc>()
        .add(AnnouncementListEvent.getInfo(isFilter: false));
    context
        .read<AnnouncementListBloc>()
        .add(AnnouncementListEvent.getIsHistory(true));
    context
        .read<AnnouncementListBloc>()
        .add(AnnouncementListEvent.getFilterClear());
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
  Widget build(BuildContext context) => BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      builder: (context, state) => CustomScreen(
        child: Scaffold(
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: NestedScrollView(
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
                    WScaleAnimation(
                      onTap: () {
                        filterBottomSheet(
                          context,
                          onChanged: (value) =>
                              setState(() => sortingValue = value),
                          sortingValue: sortingValue,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppIcons.arrowsSort,
                          color: orange,
                        ),
                      ),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  delegate: AdsSliverWidget(
                    size: MediaQuery.of(context).size,
                    theme: Theme.of(context).extension<ThemedColors>()!,
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
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: state.isHistory
              ? const SizedBox()
              : WScaleAnimation(
                  onTap: () {
                    if (context.read<GetMakesBloc>().state.name.isNotEmpty &&
                        context.read<GetCarModelBloc>().state.name.isNotEmpty) {
                      context
                          .read<AnnouncementListBloc>()
                          .add(AnnouncementListEvent.getIsHistory(true));
                      context
                          .read<AnnouncementListBloc>()
                          .add(AnnouncementListEvent.getHistoryApi());
                      context.read<ShowPopUpBloc>().add(ShowPopUp(
                            message: LocaleKeys.search_history_saved.tr(),
                            status: PopStatus.success,
                            dismissible: false,
                          ));
                    }
                    setState(() {});

                    //!mysearches ni sonini oshirish kk, shuning uchun profile ni data larini backdan olyapmiz
                    context.read<ProfileBloc>().add(GetProfileEvent());
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
                      width:
                          crossFadeState == CrossFadeState.showFirst ? 221 : 44,
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
                                    ? FittedBox(
                                        fit: BoxFit.cover,
                                        child: Text(
                                          LocaleKeys.save_search.tr(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: white,
                                          ),
                                        ),
                                      )
                                    : const Text('')
                              else
                                Text(
                                  LocaleKeys.save_search.tr(),
                                  style: const TextStyle(
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
    );
}
