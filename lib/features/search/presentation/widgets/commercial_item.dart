import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_sliver_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/presentation/widgets/profile_tab_bar.dart';
import 'package:auto/features/search/presentation/pages/select_car.dart';
import 'package:auto/features/search/presentation/widgets/all_commertial_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommercialItem extends StatefulWidget {
  const CommercialItem({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, item) => [
            WSliverAppBar(
              title: 'Лёгкий коммерческий транспорт',
              icon: WScaleAnimation(
                  onTap: () => Navigator.push(
                      context, fade(page: const SelectCarScreen())),
                  child: SvgPicture.asset(AppIcons.searchWithHeart)),
              child: Expanded(
                child: ProfileTabBar(
                  tabController: tabController,
                  onTap: (index) {},
                  tabs: const [
                    'Все',
                    'Новые',
                    'С пробегом',
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 8, 10),
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
                                      'Параметры',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: orange),
                                    ),
                                    Spacer(),
                                    WScaleAnimation(
                                      child: Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .ghostToGondola),
                                          child: SvgPicture.asset(
                                              AppIcons.closeWhite)),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
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
                                        child: SvgPicture.asset(
                                            AppIcons.closeWhite)),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AllCommercialItem(
                      autoName: 'Mercedes-Benz Sprinter',
                      autoYear: 2020,
                      clientName: 'Анвар Гулямов',
                      title:
                          'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует...',
                      priceAuto: '227 000 000 UZS',
                      oldPriceAuto: '270 000 000 UZS',
                      clientAvatar:
                          'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                      image1:
                          'https://images.unsplash.com/photo-1659812903095-d7e87abb0b3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                      image2:
                          'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                      isClient: true,
                      isSalon: false,
                      isLike: true,
                      isScale: true,
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
                        child: Text('Загрузить еще',
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
