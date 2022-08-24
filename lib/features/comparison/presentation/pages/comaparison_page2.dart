import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/domain/entities/characteristics_model.dart';
import 'package:auto/features/comparison/domain/entities/chracteristics_parameters_model.dart';
import 'package:auto/features/comparison/domain/entities/complectation_model.dart';
import 'package:auto/features/comparison/domain/entities/complectation_parameters_model.dart';
import 'package:auto/features/comparison/presentation/widgets/main_parameters_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/sliver_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class ComparisonPage2 extends StatefulWidget {
  final int numberOfAddedCars;
  const ComparisonPage2({Key? key, required this.numberOfAddedCars})
      : super(key: key);

  @override
  State<ComparisonPage2> createState() => _ComparisonPage2State();
}

class _ComparisonPage2State extends State<ComparisonPage2> {
  bool showDifferences = false;
  int currentValueOfCharacteristics = -1;
  int currentValueOfComplectation = -1;
  late int totalNUmberOfParameters;
  double pii = 0;

  late ScrollController sliverWidgetScrollController;
  late LinkedScrollControllerGroup linkedScrollControllerGroup;
  late List<ScrollController> scrollControllers;
  List<Characteristics> characteristicsParameters = [
    Characteristics(
      parameterName: 'Основные',
      id: 0,
      comparisonParameters: [
        CharacteristicsParameters(comparisonParameters: 'Год выпуска'),
        CharacteristicsParameters(comparisonParameters: 'Пробег'),
        CharacteristicsParameters(
            comparisonParameters: 'Сколько было владельцев?'),
        CharacteristicsParameters(comparisonParameters: 'Состояние'),
        CharacteristicsParameters(comparisonParameters: 'Цвет'),
        CharacteristicsParameters(comparisonParameters: 'Разгон до 100 км/ч'),
        CharacteristicsParameters(comparisonParameters: 'Объем багажника'),
        CharacteristicsParameters(comparisonParameters: 'Класс автомобиля'),
        CharacteristicsParameters(comparisonParameters: 'Тип кузова')
      ],
    ),
    Characteristics(parameterName: 'Размеры', id: 1, comparisonParameters: [
      CharacteristicsParameters(comparisonParameters: 'Год выпуска'),
      CharacteristicsParameters(comparisonParameters: 'Пробег'),
      CharacteristicsParameters(
          comparisonParameters: 'Сколько было владельцев?'),
    ]),
    Characteristics(
        parameterName: 'Объем и масса', id: 2, comparisonParameters: []),
    Characteristics(
        parameterName: 'Двигатель', id: 3, comparisonParameters: []),
    Characteristics(
        parameterName: 'Подвески и тормоза', id: 4, comparisonParameters: []),
    Characteristics(parameterName: 'Прочее', id: 5, comparisonParameters: []),
  ];
  List<Complectation> complectationParameters = [
    Complectation(
        parameterName: 'Элементы экстерьера',
        id: 0,
        complectationParameters: [
          ComplectationParameters(comparisonParameters: 'Рейлинги на крыше'),
          ComplectationParameters(comparisonParameters: 'Аэрография')
        ]),
    Complectation(parameterName: 'Обзор', id: 1, complectationParameters: []),
    Complectation(
        parameterName: 'Безопасность', id: 2, complectationParameters: []),
    Complectation(
        parameterName: 'Мультимедиа', id: 3, complectationParameters: []),
    Complectation(
        parameterName: 'Защита от угона', id: 10, complectationParameters: [])
  ];

  @override
  void initState() {
    totalNUmberOfParameters =
        characteristicsParameters.length + complectationParameters.length;
    sliverWidgetScrollController = ScrollController();
    linkedScrollControllerGroup = LinkedScrollControllerGroup();
    scrollControllers = [
      ...List.generate(
          characteristicsParameters.length + complectationParameters.length + 1,
          (index) => ScrollController())
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
  Widget build(BuildContext context) => Scaffold(
      backgroundColor:
          Theme.of(context).extension<ThemedColors>()!.solitudeContainerToBlack,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(AppIcons.chevronLeft)),
        ),
        elevation: 0,
        title: const Text('Сарвнение автомобилей'),
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverPersistentHeader(
                delegate: SliverWidget(
                  numberOfAddedCars: widget.numberOfAddedCars,
                  boolean: showDifferences,
                  onChanged: (showDifferences1) =>
                      setState(() => showDifferences = showDifferences1),
                  scrollController: sliverWidgetScrollController,
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
                        'Характеристики',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    ...List.generate(
                      characteristicsParameters.length,
                      (index) => CharacteristicsParametersWidget(
                        onChanged: (integer) {
                          setState(() {
                            currentValueOfCharacteristics = integer;
                          });
                        },
                        parameterName:
                            characteristicsParameters[index].parameterName,
                        selectedValue: currentValueOfCharacteristics,
                        parameterId: characteristicsParameters[index].id,
                        listOfComparisonParameters:
                            characteristicsParameters[index]
                                .comparisonParameters,
                        characteristicsOrComplectation: 'characteristics',
                        numberOfAddedCars: widget.numberOfAddedCars,
                        controller: scrollControllers[index],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 16),
                      child: Text(
                        'Комплектация',
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
                        numberOfAddedCars: 2,
                        controller: scrollControllers[
                            index + characteristicsParameters.length],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}
