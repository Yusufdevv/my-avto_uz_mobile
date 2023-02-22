import 'dart:math';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EquipmentCategory extends StatefulWidget {
  const EquipmentCategory({
    required this.categoryName,
    required this.list,
    Key? key,
  }) : super(key: key);

  final String categoryName;
  final List<String> list;

  @override
  State<EquipmentCategory> createState() => _EquipmentCategoryState();
}

class _EquipmentCategoryState extends State<EquipmentCategory> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      child: Text(
                        widget.categoryName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: greyText),
                      ),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: _expanded ? pi : 0),
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chevronDown,
                      color: warmerGrey,
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
            firstChild: SizedBox(
              height: widget.list.length * 54,
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.list[index],
                            style: const TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            behavior: HitTestBehavior.opaque,
                            child: WCheckBox(
                              isChecked: false,
                              checkBoxColor: orange,
                            ),
                          ),
                        ],
                      )),
                  separatorBuilder: (context, index) => const Divider(
                        indent: 16,
                        height: 0,
                      ),
                  itemCount: widget.list.length),
            ),
            secondChild: const SizedBox(),
            crossFadeState: _expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(height: _expanded ? 12 : 0),
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context)
                  .extension<ThemedColors>()
                  ?.solitude2ToNightRider,
            ),
          ),
        ],
      );
}
