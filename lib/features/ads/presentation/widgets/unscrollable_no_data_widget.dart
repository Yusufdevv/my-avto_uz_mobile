import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/widgets/ads_app_bar.dart';
import 'package:auto/features/ads/presentation/widgets/ads_sliver_deleget.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:flutter/material.dart';

class UnScrollableNoDataWidget extends StatelessWidget {
  final VoidCallback onBackButtonTap;
  final VoidCallback onSortTap;
  final Duration fadeDuration;
  final CrossFadeState crossfade;
  final TabController tabController;
  final AnnouncementListBloc announcementListBloc;

  const UnScrollableNoDataWidget(
      {required this.onBackButtonTap,
      required this.onSortTap,
      required this.fadeDuration,
      required this.crossfade,
      required this.tabController,
      required this.announcementListBloc,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          AdsAppBar(
            onBackButtonTap: onBackButtonTap,
            onSortTap: onSortTap,
            fadeDuration: fadeDuration,
            crossFadeState: crossfade,
          ),
          SliverPersistentHeader(
            delegate: AdsSliverWidget(
              size: MediaQuery.of(context).size,
              theme: Theme.of(context).extension<ThemedColors>()!,
              tabController: tabController,
              bloc: announcementListBloc,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: NoDataWidget(),
            ),
          ),
        ],
      );
}
