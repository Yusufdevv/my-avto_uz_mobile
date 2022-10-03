import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/presentation/pages/cars/pages/cars_screen.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/pages/rent_filter_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(108),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WAppBar(
                title: LocaleKeys.auto_rent.tr(),
                extraActions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: WScaleAnimation(
                        onTap: () => Navigator.push(
                            context, fade(page: const RentFilterScreen())),
                        child: SvgPicture.asset(AppIcons.rentFilter)),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                        color: dark.withOpacity(.08),
                      ),
                      BoxShadow(
                        offset: const Offset(0, -1),
                        color: dark.withOpacity(.08),
                      ),
                    ]),
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: stormGrey12,
                  ),
                  padding: const EdgeInsets.all(2),
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToDolphin,
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.04),
                              blurRadius: 1,
                              offset: const Offset(0, 3)),
                          BoxShadow(
                              color: black.withOpacity(0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 3)),
                        ]),
                    labelColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .blackToWhite,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                    unselectedLabelColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .blackToWhite,
                    unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                    tabs: [
                      Tab(
                        text: LocaleKeys.passenger_cars.tr(),
                      ),
                      Tab(
                        text: LocaleKeys.commercial.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            CarsScreen(),
            CarsScreen(),
          ],
        ),
      );
}
