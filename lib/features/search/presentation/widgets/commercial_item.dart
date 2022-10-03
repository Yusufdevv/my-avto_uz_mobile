import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/presentation/widgets/profile_tab_bar.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/presentation/pages/parameter_screen.dart';
import 'package:auto/features/search/presentation/pages/select_car.dart';
import 'package:auto/features/search/presentation/widgets/all_commertial_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommercialItem extends StatefulWidget {
  final CommercialItemEntity entity;
  const CommercialItem({required this.entity,Key? key}) : super(key: key);

  @override
  State<CommercialItem> createState() => _CommercialItemState();
}

class _CommercialItemState extends State<CommercialItem>
    with TickerProviderStateMixin {
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

  final List<CommercialItemEntity> commercialItemEntity = [
     CommercialItemEntity(
      autoName: 'Mercedes-Benz Sprinter',
      autoYear: 2020,
      clientName: 'Анвар Гулямов',
      title:
          'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует...',
      priceAuto: '227 000 000 UZS',
      oldPriceAuto: '270 000 000 UZS',
      clientAvatar:
          'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  images: ['https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'],
      isSalon: false,
      isLike: true, model: 'Sprinteing',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, item) => <Widget>[
            SliverAppBar(
              elevation: 0,
              pinned: true,
              titleSpacing: 16,
              title: Row(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SvgPicture.asset(AppIcons.chevronLeft),
                    ),
                  ),
                   SizedBox(width: 8),
                  Text(
                    LocaleKeys.light_commercial_vehicles.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              actions: [
                WScaleAnimation(
                  onTap: () => Navigator.push(
                      context, fade(page: const SelectCarScreen())),
                  child: SvgPicture.asset(AppIcons.searchWithHeart),
                ),
                const SizedBox(width: 16),
              ],
            ),
            SliverPersistentHeader(
              delegate: ProfileTabBar(
                tabController: tabController,
                onTap: (index) {},
                tabs: [
                  LocaleKeys.all.tr(),
                  LocaleKeys.news.tr(),
                  LocaleKeys.with_Mileage.tr(),
                ],
              ),
            )
          ],
          body: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Theme.of(context).dividerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mercedes-Benz',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Sprinter',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: WScaleAnimation(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const ParameterScreen()));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Theme.of(context).dividerColor)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.parameter),
                                    const SizedBox(width: 8),
                                    Text(
                                      LocaleKeys.settings.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: orange),
                                    ),
                                    const Spacer(),
                                    WScaleAnimation(
                                      child: Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .ghostToGondola),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: SvgPicture.asset(
                                                AppIcons.closeWhite),
                                          )),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Theme.of(context).dividerColor)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.location,
                                      width: 16, height: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    'г. Ташкент',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  const Spacer(),
                                  WScaleAnimation(
                                    child: Container(
                                        height: 14,
                                        width: 14,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .ghostToGondola),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SvgPicture.asset(
                                              AppIcons.closeWhite),
                                        )),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      commercialItemEntity.length,
                      (index) => AllCommercialItem(
                        commercialItemEntity: commercialItemEntity[index],
                      ),
                    ),
                    const SizedBox(height: 16),
                    WScaleAnimation(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Theme.of(context).dividerColor),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 11),
                        child: Text(LocaleKeys.load_more.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .midnightExpressToDolphin)),
                      ),
                    )
                  ],
                ),
              ),
              Column(),
              Column(),
            ],
          ),
        ),
      );
}
