import 'package:auto/features/common/widgets/w_sliver_app_bar.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/presentation/widgets/all_tabs.dart';
import 'package:auto/features/profile/presentation/widgets/profile_tab_bar.dart';
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
            WSliverAppBar(
              title: 'Мои объявления',
              child: Expanded(
                child: ProfileTabBar(
                  tabController: tabController,
                  onTap: (index) {},
                  tabs: const [
                    'Все',
                    'Действующие',
                    'Закрытые',
                  ],
                ),
              ),
            ),
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
