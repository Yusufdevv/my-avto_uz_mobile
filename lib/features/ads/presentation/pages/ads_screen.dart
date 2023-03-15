import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/ads/presentation/pages/ads_body_screen.dart';
import 'package:auto/features/ads/presentation/widgets/ads_appbar_sliver_delegate.dart';
import 'package:auto/features/ads/presentation/widgets/ads_sliver_deleget.dart';
import 'package:auto/features/ads/presentation/widgets/button_go_to_comparison.dart';
import 'package:auto/features/ads/presentation/widgets/filter_bottom_sheet.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({
    this.make,
    this.modelId,
    this.historyId,
    this.modelName,
    this.queryData,
    this.isFromComparison = false,
    this.historySaved = true,
    Key? key,
  }) : super(key: key);

  final MakeEntity? make;
  final int? modelId;
  final int? historyId;
  final String? modelName;
  final QueryDataModel? queryData;
  final bool isFromComparison;
  final bool historySaved;

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  GlobalKey key = GlobalKey();
  double height = 140;
  late AnnouncementListBloc announcementListBloc;

  void _scrollListener() {
    announcementListBloc.add(ChangeAppBarEvent(
        crossFadeState:
            _isShrink ? CrossFadeState.showSecond : CrossFadeState.showFirst));
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
    announcementListBloc = AnnouncementListBloc();
    Currency currency;
    if (widget.queryData?.currency == 'uzs') {
      currency = Currency.uzs;
    } else if (widget.queryData?.currency == 'usd') {
      currency = Currency.usd;
    } else {
      currency = Currency.none;
    }
    announcementListBloc
      ..add(SetMakeModel(
        modelId: widget.modelId,
        modelName: widget.modelName,
        make: widget.make ?? const MakeEntity(),
        historySaved: widget.historySaved,
      ))
      ..add(SetFilter(
        historyId: widget.historyId,
        bodyType: widget.queryData?.bodyType ?? const BodyTypeEntity(),
        gearboxType: widget.queryData?.gearboxType ?? const GearboxTypeEntity(),
        driveType: widget.queryData?.driveType ?? const DriveTypeEntity(),
        yearValues: RangeValues(widget.queryData?.yearFrom?.toDouble() ?? 0,
            widget.queryData?.yearTo?.toDouble() ?? 0),
        priceValues: RangeValues(widget.queryData?.priceFrom?.toDouble() ?? 0,
            widget.queryData?.priceTo?.toDouble() ?? 0),
        currency: currency,
      ));

    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  final fadeDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => announcementListBloc,
        child: BlocConsumer<AnnouncementListBloc, AnnouncementListState>(
          listener: (context, state) {
            if (state.saveFilterStatus.isSubmissionSuccess) {
              context.read<ShowPopUpBloc>().add(ShowPopUp(
                    message: LocaleKeys.search_history_saved.tr(),
                    status: PopStatus.success,
                    dismissible: false,
                  ));
              announcementListBloc
                  .add(const ChangeSaveFilterStatus(FormzStatus.pure));
              //!mysearches ni sonini oshirish uchun ishlatilgan, mySearchesCount ga 1 ta qo'shishni bildiradi
              if (state.historyId != null) {
                context.read<ProfileBloc>().add(
                    ChangeCountDataEvent(adding: true, mySearchesCount: 1));
              }
            }
          },
          builder: (context, state) => CustomScreen(
            child: Scaffold(
              extendBody: true,
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
                        onTap: () => Navigator.pop(context),
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
                        crossFadeState: state.crossFadeState,
                      ),
                      actions: [
                        WScaleAnimation(
                          onTap: () {
                            filterBottomSheet(
                              context,
                              onChanged: (value) {
                                print('value:$value');
                                announcementListBloc
                                    .add(SetSort(sortResult: value));
                              },
                              sortingValue: state.sortStatus,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 16, left: 16, top: 8, bottom: 8),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(AppIcons.arrowsSort,
                                color: orange),
                          ),
                        ),
                      ],
                    ),
                    SliverPersistentHeader(
                      delegate: AdsSliverWidget(

                        size: MediaQuery.of(context).size,
                        theme: Theme.of(context).extension<ThemedColors>()!,
                        tabController: tabController,
                        bloc: announcementListBloc,
                      ),
                    ),
                  ],
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      AdsBodyScreen(
                        isFromComparison: widget.isFromComparison,
                        isNew: null,
                        announcementListBloc: announcementListBloc,
                      ),
                      AdsBodyScreen(
                        isFromComparison: widget.isFromComparison,
                        isNew: true,
                        announcementListBloc: announcementListBloc,
                      ),
                      AdsBodyScreen(
                        isFromComparison: widget.isFromComparison,
                        isNew: false,
                        announcementListBloc: announcementListBloc,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar:
                  widget.isFromComparison ? const ButtonGoToComparison() : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: !widget.isFromComparison
                  ? !state.historySaved
                      ? WScaleAnimation(
                          onTap: () {
                            announcementListBloc.add(const SaveHistory());
                          },
                          child: AnimatedContainer(
                            alignment:
                                state.crossFadeState == CrossFadeState.showFirst
                                    ? const Alignment(-.2, 0)
                                    : const Alignment(-.85, 0),
                            width:
                                state.crossFadeState == CrossFadeState.showFirst
                                    ? double.maxFinite
                                    : 44,
                            height: 44,
                            duration: fadeDuration,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(22)),
                              width: state.crossFadeState ==
                                      CrossFadeState.showFirst
                                  ? 221
                                  : 44,
                              height: 44,
                              child: AnimatedCrossFade(
                                alignment: Alignment.center,
                                duration: fadeDuration,
                                crossFadeState: state.crossFadeState,
                                firstChild: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 12),
                                  child: SvgPicture.asset(
                                    AppIcons.searchWithHeartWhite,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null
                  : null,
            ),
          ),
        ),
      );
}
