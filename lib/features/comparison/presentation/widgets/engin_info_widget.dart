import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/entities/complectation_entity.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EngineParametersWidget extends StatefulWidget {
  final ScrollController controller;
  final List<ComparisonEntity> numberOfAddedCars;
  final Complectation comparisonParameters;
  final int selectedValue;
  final ValueChanged<int> onChanged;
  final double width;

  const EngineParametersWidget({
    required this.onChanged,
    required this.selectedValue,
    required this.comparisonParameters,
    required this.numberOfAddedCars,
    required this.controller,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<EngineParametersWidget> createState() => _EngineParametersWidgetState();
}

class _EngineParametersWidgetState extends State<EngineParametersWidget> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (widget.selectedValue == widget.comparisonParameters.id) {
                widget.onChanged(-1);
              } else {
                widget.onChanged(widget.comparisonParameters.id);
              }
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: widget.selectedValue !=
                                widget.comparisonParameters.id
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
                        widget.comparisonParameters.parameterName.tr(),
                      ),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                        begin: 0,
                        end: widget.selectedValue ==
                                widget.comparisonParameters.id
                            ? pi
                            : 0),
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chevronDown,
                      color:
                          widget.selectedValue != widget.comparisonParameters.id
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
                  height: widget
                          .comparisonParameters.complectationParameters.length *
                      54,
                  child: ListView(
                    controller: widget.controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        widget.numberOfAddedCars.length + 1,
                        (index) => Column(
                          children: [
                            ComparisionListTile(
                              width: widget.width,
                              info: index == widget.numberOfAddedCars.length
                                  ? ''
                                  : widget.numberOfAddedCars[index].announcement
                                      .engineData.engineType,
                              isGrey: true,
                            ),
                            ComparisionListTile(
                              width: widget.width,
                              info: index == widget.numberOfAddedCars.length
                                  ? ''
                                  : widget.numberOfAddedCars[index].announcement
                                      .engineData.power,
                              isGrey: false,
                            ),
                            ComparisionListTile(
                              width: widget.width,
                              info: index == widget.numberOfAddedCars.length
                                  ? ''
                                  : widget.numberOfAddedCars[index].announcement
                                      .engineData.volume,
                              isGrey: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  widget.comparisonParameters.complectationParameters.length,
                  (index) => Positioned(
                    top: 8 + index * 54,
                    left: 16,
                    child: Text(
                      widget.comparisonParameters.complectationParameters[index]
                          .comparisonParameters
                          .tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: LightThemeColors.displayMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            secondChild: const SizedBox(),
            crossFadeState:
                widget.selectedValue == widget.comparisonParameters.id
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height:
                widget.selectedValue == widget.comparisonParameters.id ? 12 : 0,
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
