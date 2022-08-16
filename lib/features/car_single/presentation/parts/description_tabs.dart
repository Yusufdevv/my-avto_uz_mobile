import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:flutter/material.dart';

class DescriptionTabs extends StatefulWidget {
  const DescriptionTabs({Key? key}) : super(key: key);

  @override
  State<DescriptionTabs> createState() => _DescriptionTabsState();
}

class _DescriptionTabsState extends State<DescriptionTabs>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        color: background,
        padding: const EdgeInsets.only(bottom: 16, top: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: dark1,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                  controller: _tabController,
                  padding: const EdgeInsets.all(2),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff636366)),
                  tabs: const [
                    Tab(
                      text: 'Описание',
                    ),
                    Tab(
                      text: 'Характеристика',
                    ),
                  ]),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 200,
              child: TabBarView(controller: _tabController, children: [
                Container(
                  color: dark1,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [SellerComment(),],
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 50,
                ),
              ]),
            )
          ],
        ),
      );
}
