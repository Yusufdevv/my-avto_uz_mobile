// ignore_for_file: directives_ordering

import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/comparison/domain/entities/complectation_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_parameters_entity.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand_page.dart';
import 'package:auto/features/comparison/presentation/widgets/engin_info_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/characteristics_parameters_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_sliver_delegate.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Comparison extends StatefulWidget {
  final bool isSticky;
  final ComparisonBloc comparisonBloc;

  const Comparison({
    required this.isSticky,
    required this.comparisonBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  bool showDifferences = false;
  int currentValueOfCharacteristics = -1;
  int currentValueOfComplectation = -1;
  late int totalNUmberOfParameters;
  double pii = 0;

  late ScrollController sliverWidgetScrollController;
  late LinkedScrollControllerGroup linkedScrollControllerGroup;
  late List<ScrollController> scrollControllers;
  late TextEditingController searchController;
  List<Complectation> complectationParameters = [
    Complectation(
      parameterName: 'Main Data',
      id: 0,
      complectationParameters: [
        ComplectationParametersEntity(
          comparisonParameters: 'Make',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Generation',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Body Type',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Drive Type',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Gearbox Type',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Year',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Color',
        )
      ],
    ),
    Complectation(
      parameterName: 'Engine Data',
      id: 1,
      complectationParameters: [
        ComplectationParametersEntity(
          comparisonParameters: 'Engine Type',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Power',
        ),
        ComplectationParametersEntity(
          comparisonParameters: 'Volume',
        )
      ],
    ),
    Complectation(
      parameterName: 'Dimensions',
      id: 2,
      complectationParameters: [],
    ),
    Complectation(
      parameterName: 'Volume And Mass',
      id: 3,
      complectationParameters: [],
    ),
    Complectation(
      parameterName: 'Suspensions And Brakes',
      id: 10,
      complectationParameters: [],
    ),
    Complectation(
      parameterName: 'Other',
      id: 10,
      complectationParameters: [],
    ),
  ];

  @override
  void initState() {
    totalNUmberOfParameters = complectationParameters.length;
    sliverWidgetScrollController = ScrollController();
    linkedScrollControllerGroup = LinkedScrollControllerGroup();
    currentValueOfComplectation = complectationParameters[0].id;
    scrollControllers = [
      ...List.generate(
          complectationParameters.length + 1, (index) => ScrollController())
    ];
    for (var i = 0; i < totalNUmberOfParameters; i++) {
      scrollControllers[i] = linkedScrollControllerGroup.addAndGet();
    }
    sliverWidgetScrollController = linkedScrollControllerGroup.addAndGet();
    super.initState();
  }

  final GlobalKey<AnimatedListState> listkey = GlobalKey();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ComparisonBloc, ComparisonState>(
        builder: (context, state) => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: ComparisonSliverDelegete(
                    listkey: listkey,
                    numberOfAddedCars: state.cars.length,
                    boolean: showDifferences,
                    onChanged: (showDifferences1) =>
                        setState(() => showDifferences = showDifferences1),
                    scrollController: sliverWidgetScrollController,
                    onAddCar: () {
                      ///
                      Navigator.of(context)
                          .push(
                        fade(page: const ChooseCarBrandPage()),
                      )
                          .then((value) {
                        if (value != null) {
                          final result = value as Map<String, dynamic>;
                          final makeId = result['makeId'];
                          final modelId = result['modelId'];
                          Navigator.of(context, rootNavigator: true)
                              .push(fade(
                                  page: AdsScreen(
                            isFromComparison: true,
                            makeId: makeId,
                            modelId: modelId,
                          )))
                          
                              .then((value) {
                            if (context.read<ComparisonAddBloc>().state.count >
                                0) {
                              widget.comparisonBloc.add(GetComparableCars());
                            }
                            context
                                .read<ComparisonAddBloc>()
                                .add(ComparisonAddEvent.clearCountComparison());
                          });
                        }
                      });
                    },
                    setSticky: (val) {
                      context
                          .read<ComparisonBloc>()
                          .add(SetStickyEvent(isSticky: val));
                    },
                    comparisonBloc: widget.comparisonBloc,
                  ),
                ),
              ),
            )
          ],
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 16),
                          child: Text(
                            LocaleKeys.characters.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        CharacteristicsParametersWidget(
                          onChanged: (integer) {
                            setState(() {
                              currentValueOfComplectation = integer;
                            });
                          },
                          selectedValue: currentValueOfComplectation,
                          comparisonParameters: complectationParameters[0],
                          numberOfAddedCars: state.cars,
                          controller: scrollControllers[0],
                        ),
                        EngineParametersWidget(
                          onChanged: (integer) {
                            setState(() {
                              currentValueOfCharacteristics = integer;
                            });
                          },
                          selectedValue: currentValueOfCharacteristics,
                          comparisonParameters: complectationParameters[1],
                          numberOfAddedCars: state.cars,
                          controller: scrollControllers[1],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
