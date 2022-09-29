import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/presentation/widgets/all_tabs.dart';
import 'package:auto/features/profile/presentation/widgets/profile_tab_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyAdScreen extends StatefulWidget {
  const MyAdScreen({Key? key}) : super(key: key);

  @override
  State<MyAdScreen> createState() => _MyAdScreenState();
}

class _MyAdScreenState extends State<MyAdScreen> with TickerProviderStateMixin {
  late TabController tabController;
  final List<ProfileItemEntity> list = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, item) => [
             SliverAppBar(
              pinned: true,
              title: Text(LocaleKeys.my_ads.tr()),
            ),
            SliverPersistentHeader(
              delegate: ProfileTabBar(
                tabController: tabController,
                onTap: (index) {},
                tabs: [
                  LocaleKeys.all.tr(),
                  LocaleKeys.using.tr(),
                  LocaleKeys.close.tr(),
                ],
              ),
            )
          ],
          body: TabBarView(
            controller: tabController,
            children: [
              const AllTabs(),
              Column(),
              Column(),
            ],
          ),
        ),
      );
}
