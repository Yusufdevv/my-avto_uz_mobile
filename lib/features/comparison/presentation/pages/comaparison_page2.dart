import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/comparison/domain/entities/characteristics_model.dart';
import 'package:auto/features/comparison/domain/entities/chracteristics_parameters_model.dart';
import 'package:auto/features/comparison/domain/entities/complectation_model.dart';
import 'package:auto/features/comparison/domain/entities/complectation_parameters_model.dart';
import 'package:auto/features/comparison/presentation/widgets/parameters_widget.dart';
import 'package:auto/features/comparison/presentation/widgets/sliver_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComparisonPage2 extends StatefulWidget {
  final int numberofAddedCars;
  const ComparisonPage2({Key? key, required this.numberofAddedCars})
      : super(key: key);

  @override
  State<ComparisonPage2> createState() => _ComparisonPage2State();
}

class _ComparisonPage2State extends State<ComparisonPage2> {
  bool showDifferences = false;
  int currentValue = -1;
  double pii = 0;
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
        id: 7,
        complectationParameters: [
          ComplectationParameters(comparisonParameters: 'Рейлинги на крыше'),
          ComplectationParameters(comparisonParameters: 'Аэрография')
        ]),
    Complectation(parameterName: 'Обзор', id: 11, complectationParameters: []),
    Complectation(
        parameterName: 'Безопасность', id: 8, complectationParameters: []),
    Complectation(
        parameterName: 'Мультимедиа', id: 9, complectationParameters: []),
    Complectation(
        parameterName: 'Защита от угона', id: 10, complectationParameters: [])
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
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
                    numberOfAddedCars: widget.numberofAddedCars,
                    Boolean: showDifferences,
                    onChanged: (showDifferences1) =>
                        setState(() => showDifferences = showDifferences1)),
                pinned: true,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  'Характеристики',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
              ...List.generate(
                characteristicsParameters.length,
                (index) => CharacteristicsParametersWidget(
                  parameterName: characteristicsParameters[index].parameterName,
                  onChanged: (value) {
                    setState(() => currentValue = value);
                  },
                  selectedValue: currentValue,
                  parameterId: characteristicsParameters[index].id,
                  listOfComparisonParameters:
                      characteristicsParameters[index].comparisonParameters,
                  characteristicsOrComplectation: 'characteristics',
                  numberOfAddedCars: widget.numberofAddedCars,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  'Комплектация',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
              ...List.generate(
                complectationParameters.length,
                (index) => CharacteristicsParametersWidget(
                  parameterName: complectationParameters[index].parameterName,
                  onChanged: (value) {
                    setState(() => currentValue = value);
                  },
                  selectedValue: currentValue,
                  parameterId: complectationParameters[index].id,
                  listOfComparisonParameters:
                      complectationParameters[index].complectationParameters,
                  characteristicsOrComplectation: 'complectation',
                  numberOfAddedCars: widget.numberofAddedCars,
                ),
              ),
            ],
          ),
        ),
      ));
}
