import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_body_type.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/commercial_bloc/commercial_bloc.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/cars/pages/cars_screen.dart';
import 'package:auto/features/rent/presentation/pages/cars/pages/commercial_screen.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/pages/rent_filter_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// GetMakesUseCase
class RentScreen extends StatefulWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late RentBloc rentBloc;
  late CommercialBloc commercialBloc;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    rentBloc = RentBloc(rentUseCase: RentUseCase(), id: 5)
      ..add(RentGetResultsEvent(isRefresh: false));
    commercialBloc = CommercialBloc(RentUseCase(), 6)
      ..add(CommercialEvent.getResults(isRefresh: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: rentBloc),
          BlocProvider.value(value: commercialBloc),
        ],
        child: BlocBuilder<RentBloc, RentState>(
          builder: (context, state) => Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WAppBar(
                    boxShadow: const [],
                    title: LocaleKeys.auto_rent.tr(),
                    extraActions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: WScaleAnimation(
                          onTap: () {
                            context
                                .read<RegionsBloc>()
                                .add(RegionsEvent.getRegions());
                            Navigator.push(
                                    context,
                                    fade(
                                        page: RentFilterScreen(
                                            rentBloc: rentBloc)))
                                .then((value) =>
                                    rentBloc.add(RentGetResultsEvent()));
                          },
                          child: SvgPicture.asset(AppIcons.rentFilter),
                        ),
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
                              spreadRadius: 0),
                        ]),
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: stormGrey12,
                      ),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: TabBar(
                        onTap: (v) {
                          rentBloc.add(RentSetIdEvent(
                              categoryId: v == 0 ? 5 : 6, isRefresh: false));
                        },
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
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
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              children: [
                CarsScreen(id: state.categoryId),
                const CommercialScreen(),
              ],
            ),
          ),
        ),
      );
}
