import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/comparison/domain/entities/complectation_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_parameters_entity.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/comparison/presentation/widgets/engin_info_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/main_parameters_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/sliver_delegate.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Comparison extends StatefulWidget {
  final bool isSticky;
  final ComparisonBloc comparisonBloc;
  const Comparison({
    Key? key,
    required this.isSticky,
    required this.comparisonBloc,
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

  @override
  void dispose() {
    sliverWidgetScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ComparisonBloc, ComparisonState>(
        bloc: widget.comparisonBloc,
        builder: (context, state) => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverWidget(
                    numberOfAddedCars: state.cars.length,
                    boolean: showDifferences,
                    onChanged: (showDifferences1) =>
                        setState(() => showDifferences = showDifferences1),
                    scrollController: sliverWidgetScrollController,
                    onAddCar: () => Navigator.of(context).push(
                      fade(
                        page: ChooseCarBrandComparison(
                          onTap: () => Navigator.of(context).push(
                            fade(
                              page: ChooseCarModelComparison(
                                onTap: () {
                                  context.read<AnnouncementListBloc>().add(
                                        AnnouncementListEvent.getFilter(
                                          context
                                              .read<AnnouncementListBloc>()
                                              .state
                                              .filter
                                              .copyWith(
                                                  make: context
                                                      .read<GetMakesBloc>()
                                                      .state
                                                      .selectId,
                                                  model: context
                                                      .read<GetCarModelBloc>()
                                                      .state
                                                      .selectedId),
                                        ),
                                      );
                                  print(
                                      '===> ==> Bu selectMak Id ${context.read<GetMakesBloc>().state.selectId}');
                                  print(
                                      '===> ==> Bu selectModel Id ${context.read<GetCarModelBloc>().state.selectedId}');

                                  Navigator.of(context).push(
                                    fade(
                                      page: AdsScreen(
                                        onBack: () {
                                          widget.comparisonBloc
                                              .add(GetComparableCars());
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 16),
                        child: Text(
                          'Характеристики',
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
                            currentValueOfComplectation = integer;
                          });
                        },
                        selectedValue: currentValueOfComplectation,
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
      );
}
