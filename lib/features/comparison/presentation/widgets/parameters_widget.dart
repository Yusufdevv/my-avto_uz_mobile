import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/presentation/widgets/characteristics_comparison_parameters.dart';
import 'package:auto/features/comparison/presentation/widgets/complectation_comparison_pararmeters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacteristicsParametersWidget extends StatelessWidget {
  final int numberOfAddedCars;
  final String characteristicsOrComplectation;
  final List listOfComparisonParameters;
  final int selectedValue;
  final int parameterId;
  final String parameterName;
  final ValueChanged<int> onChanged;
  const CharacteristicsParametersWidget({
    required this.onChanged,
    required this.parameterName,
    required this.selectedValue,
    required this.parameterId,
    required this.listOfComparisonParameters,
    required this.characteristicsOrComplectation,
    required this.numberOfAddedCars,
    Key? key,
    // required this.pii,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (selectedValue == parameterId) {
                onChanged(-1);
              } else {
                onChanged(parameterId);
              }
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                          color: selectedValue != parameterId
                              ? Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .midnightExpressToWhite
                              : orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      duration: const Duration(milliseconds: 100),
                      child: Text(parameterName),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                        begin: 0, end: selectedValue == parameterId ? pi : 0),
                    duration: const Duration(milliseconds: 100),
                    child: SvgPicture.asset(
                      AppIcons.chevronDown,
                      color: selectedValue != parameterId ? warmerGrey : orange,
                    ),
                    builder: (context, value, child) =>
                        Transform.rotate(angle: value, child: child!),
                  )
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstCurve: Curves.linear,
            firstChild: Column(
                children: List.generate(
                    listOfComparisonParameters.length,
                    (index) => Column(
                          children: [
                            if (characteristicsOrComplectation ==
                                'characteristics')
                              CharacteristicsComparisonWidget(
                                parameterName: listOfComparisonParameters[index]
                                    .comparisonParameters,
                                color: index % 2 == 0
                                    ? Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .solitudeContainerToNero1
                                    : Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .whiteToNightRider,
                                numberOfAddedCars: numberOfAddedCars,
                              )
                            else
                              ComplectationComparisonWidget(
                                color: index % 2 == 0
                                    ? Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .solitude1ToNero
                                    : Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .whiteLilacToNightRider,
                                parameterName: listOfComparisonParameters[index]
                                    .comparisonParameters,
                                status: index % 2 == 0 ? 'good' : 'notGood',
                                numberOfCars: numberOfAddedCars,
                              ),
                          ],
                        ))),
            secondChild: const SizedBox(),
            crossFadeState: selectedValue == parameterId
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: selectedValue == parameterId ? 12 : 0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitude2ToNightRider,
            ),
          ),
        ],
      );
}
