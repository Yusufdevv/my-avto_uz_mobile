// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/filter_bloc/dealer_filter_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/pages/map_screen.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DealerScreen> createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
  late DealerCardBloc bloc;
  late DealerFilterBloc filterBloc;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    bloc = DealerCardBloc(DealerUseCase());
    filterBloc = DealerFilterBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: bloc),
          BlocProvider.value(value: filterBloc),
        ],
        child: BlocBuilder<DealerCardBloc, DealerCardState>(
          builder: (context, state) => AnnotatedRegion(
            value:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            child: KeyboardDismisser(
              child: Scaffold(
                body: DefaultTabController(
                  length: 2,
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero,
                        leadingWidth: 0,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => Navigator.pop(context),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SvgPicture.asset(AppIcons.chevronLeft),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Expanded(
                                child: WTextField(
                                  borderColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToNightRider,
                                  fillColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToNightRider,
                                  hintText: LocaleKeys.model_brand.tr(),
                                  hintTextStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: grey),
                                  focusColor: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToNightRider,
                                  onChanged: (value) {
                                    bloc.add(DealerCardEvent.getResults(
                                        isRefresh: false, search: value));
                                  },
                                  controller: controller,
                                  hasSearch: true,
                                  borderRadius: 8,
                                ),
                              ),
                              const SizedBox(width: 12),
                              BlocBuilder<DealerFilterBloc, DealerFilterState>(
                                builder: (context, filterState) => WButton(
                                  onTap: () {
                                    context
                                        .read<RegionsBloc>()
                                        .add(RegionsEvent.getRegions());
                                    Navigator.push(
                                        context,
                                        fade(
                                            page: DealersFilterScreen(
                                          dealerBloc: bloc,
                                          maker: filterState.maker,
                                          regions: filterState.region,
                                          carType: filterState.carType == ''
                                              ? 'all'
                                              : filterState.carType,
                                        )));
                                  },
                                  borderRadius: 12,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmokeToNightRider,
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                    AppIcons.delaerFilter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate:
                            SegmentedControl(maxHeight: 64, minHeight: 64),
                      ),
                      const SliverFillRemaining(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            DealersList(),
                            MapScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
