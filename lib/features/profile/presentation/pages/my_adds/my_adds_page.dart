import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/profile/domain/entities/profile_item_entity.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAddsPage extends StatefulWidget {
  const MyAddsPage({required this.profileBloc,Key? key}) : super(key: key);
  final ProfileBloc profileBloc;

  @override
  State<MyAddsPage> createState() => _MyAddsPageState();
}

class _MyAddsPageState extends State<MyAddsPage> with TickerProviderStateMixin {
  late TabController tabController;
  final List<ProfileItemEntity> list = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    widget.profileBloc.add(GetProfileFavoritesEvent(endpoint:'/car/my-announcements/'));
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
              leadingWidth: 40,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          AppIcons.chevronLeft,
                        )),
                  ],
                ),
              ),
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
              const AllAds(),
              Column(
                children: const [Text('2 tab')],
              ),
              Column(
                children: const [Text('2 tab')],
              ),
            ],
          ),
        ),
      );
}
