import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/presentation/bloc/car_selector/car_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/model_selectro_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_parameters_entity.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_generation.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/comparison/presentation/widgets/main_parameters_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/sliver_delegate.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Comparison extends StatefulWidget {
  final bool isSticky;
  final List<ComparisonEntity> cars;
  final ModelSelectorBloc modelBloc;
  final CarTypeSelectorBloc carTypeSelectorBloc;
  final GetCarModelBloc carModelBloc;
  final CarSelectorBloc carSelectorBloc;
  final GetMakesBloc getMakesBloc;
  const Comparison({
    required this.cars,
    Key? key,
    required this.isSticky,
    required this.modelBloc,
    required this.carTypeSelectorBloc,
    required this.carModelBloc,
    required this.carSelectorBloc,
    required this.getMakesBloc,
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
        parameterName: LocaleKeys.exterier_elements.tr(),
        id: 0,
        complectationParameters: [
          ComplectationParametersEntity(
            comparisonParameters: LocaleKeys.roof_relief.tr(),
          ),
          ComplectationParametersEntity(
            comparisonParameters: LocaleKeys.aerography.tr(),
          )
        ]),
    Complectation(
        parameterName: LocaleKeys.view.tr(),
        id: 1,
        complectationParameters: []),
    Complectation(
        parameterName: LocaleKeys.security.tr(),
        id: 2,
        complectationParameters: []),
    Complectation(
        parameterName: LocaleKeys.multimedia.tr(),
        id: 3,
        complectationParameters: []),
    Complectation(
        parameterName: LocaleKeys.theft_protection.tr(),
        id: 10,
        complectationParameters: [])
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
  Widget build(BuildContext context) => NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverPersistentHeader(
                delegate: SliverWidget(
                  numberOfAddedCars: widget.cars.length,
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
                                Navigator.of(context).push(
                                  fade(
                                    page: ChooseGenerationComparison(
                                      onTap: () {},
                                      modelBloc: widget.modelBloc,
                                    ),
                                  ),
                                );
                              },
                              bloc: widget.carModelBloc,
                              carTypeSelectorBloc: widget.carTypeSelectorBloc,
                              modelBloc: widget.modelBloc,
                              carSelectorBloc: widget.carSelectorBloc,
                              getMakesBloc: widget.getMakesBloc,
                            ),
                          ),
                        ),
                        carSelectorBloc: widget.carSelectorBloc,
                        bloc: widget.getMakesBloc,
                      ),
                    ),
                  ),
                  setSticky: (val) {
                    context
                        .read<ComparisonBloc>()
                        .add(SetStickyEvent(isSticky: val));
                  },
                ),
                pinned: true,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 16),
                      child: Text(
                        LocaleKeys.complectation.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    ...List.generate(
                      complectationParameters.length,
                      (index) => CharacteristicsParametersWidget(
                        onChanged: (integer) {
                          setState(() {
                            currentValueOfComplectation = integer;
                          });
                        },
                        parameterName:
                            complectationParameters[index].parameterName,
                        selectedValue: currentValueOfComplectation,
                        parameterId: complectationParameters[index].id,
                        listOfComparisonParameters:
                            complectationParameters[index]
                                .complectationParameters,
                        characteristicsOrComplectation: 'complectation',
                        numberOfAddedCars: widget.cars,
                        controller: scrollControllers[index],
                        isSticky: widget.isSticky,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
