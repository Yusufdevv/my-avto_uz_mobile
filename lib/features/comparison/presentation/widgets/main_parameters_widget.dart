import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacteristicsParametersWidget extends StatelessWidget {
  final ScrollController controller;
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
    required this.controller,
    Key? key,
    // required this.pii,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
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
            firstChild: characteristicsOrComplectation == 'characteristics'
                ? Stack(
                    children: [
                      SizedBox(
                        height: listOfComparisonParameters.length * 54,
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              3,
                              (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  listOfComparisonParameters.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        color: index.isEven
                                            ? Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .solitudeContainerToNero1
                                            : Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .whiteToNightRider,
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 28),
                                        height: 54,
                                        child: Text('data',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ...List.generate(
                        listOfComparisonParameters.length,
                        (index) => Positioned(
                          top: 8 + index * 54,
                          left: 16,
                          child: Text(
                            listOfComparisonParameters[index]
                                .comparisonParameters,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      SizedBox(
                        height: listOfComparisonParameters.length * 54,
                        child: ListView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Column(
                                children: List.generate(
                                  listOfComparisonParameters.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        color: index.isEven
                                            ? Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .solitudeContainerToNero1
                                            : Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .whiteToNightRider,
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 27),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 54,
                                        child: Text('data',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ...List.generate(
                        listOfComparisonParameters.length,
                        (index) => Positioned(
                          top: 8 + index * 54,
                          left: 16,
                          child: Text(
                            listOfComparisonParameters[index]
                                .comparisonParameters,
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
          )
        ],
      );
}

/*Column(
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
                                numberOfAddedCars: 1,
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
                        )))*/
