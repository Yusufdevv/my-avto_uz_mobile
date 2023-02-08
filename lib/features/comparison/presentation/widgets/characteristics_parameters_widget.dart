import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_entity.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacteristicsParametersWidget extends StatelessWidget {
  final ScrollController controller;
  final List<ComparisonEntity> numberOfAddedCars;
  final Complectation comparisonParameters;
  final int selectedValue;
  final ValueChanged<int> onChanged;

  const CharacteristicsParametersWidget({
    required this.onChanged,
    required this.selectedValue,
    required this.comparisonParameters,
    required this.numberOfAddedCars,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (selectedValue == comparisonParameters.id) {
                onChanged(-1);
              } else {
                onChanged(comparisonParameters.id);
              }
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: selectedValue != comparisonParameters.id
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .midnightExpressToWhite
                            : orange,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      child: Text(
                        comparisonParameters.parameterName,
                      ),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                        begin: 0,
                        end: selectedValue == comparisonParameters.id ? pi : 0),
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chevronDown,
                      color: selectedValue != comparisonParameters.id
                          ? warmerGrey
                          : orange,
                    ),
                    builder: (
                      context,
                      value,
                      child,
                    ) =>
                        Transform.rotate(angle: value, child: child!),
                  )
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstCurve: Curves.linear,
            firstChild: Stack(
              children: [
                SizedBox(
                  height:
                      comparisonParameters.complectationParameters.length * 54,
                  child: ListView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        numberOfAddedCars.length + 1,
                        (index) => Column(
                          children: [
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .make,
                              isGrey: true,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .generation,
                              isGrey: false,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .bodyType
                                      .toUpperCase(),
                              isGrey: true,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .driveType
                                      .toUpperCase(),
                              isGrey: false,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .gearboxType
                                      .toUpperCase(),
                              isGrey: true,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .year
                                      .toString(),
                              isGrey: false,
                            ),
                            ComparsionList(
                              info: index == numberOfAddedCars.length
                                  ? ''
                                  : numberOfAddedCars[index]
                                      .announcement
                                      .mainData
                                      .color
                                      .toUpperCase(),
                              isGrey: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  comparisonParameters.complectationParameters.length,
                  (index) => Positioned(
                    top: 8 + index * 54,
                    left: 16,
                    child: Text(
                      comparisonParameters
                          .complectationParameters[index].comparisonParameters,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            secondChild: const SizedBox(),
            crossFadeState: selectedValue == comparisonParameters.id
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: selectedValue == comparisonParameters.id ? 12 : 0,
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
