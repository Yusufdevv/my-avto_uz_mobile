import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/dot_and_text.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComplectationBox extends StatefulWidget {
  final EquipmentEntity? equipment;
  final Map<int, String> radios;
  final Map<int, SO> selects;

  const ComplectationBox(
      {required this.equipment,
      required this.selects,
      required this.radios,
      Key? key})
      : super(key: key);

  @override
  State<ComplectationBox> createState() => _ComplectationBoxState();
}

class _ComplectationBoxState extends State<ComplectationBox> {
  List<String> allOptions = [];

  late int length;
  final int limit = 6;
  late bool isCollapsable;

  late bool isCollapsed = true;

  @override
  void initState() {
    super.initState();

    if (widget.equipment != null) {
      allOptions.addAll(widget.equipment!.options.map((e) => e.option.name));
    }
    allOptions
      ..addAll(widget.selects.entries.map((e) => e.value.optionName))
      ..addAll(widget.radios.entries.map((e) => e.value));
    length = allOptions.length > limit ? limit : allOptions.length;
    isCollapsable = length == limit && limit != allOptions.length;
  }

  @override
  Widget build(BuildContext context) {
    if (allOptions.isEmpty) {
      return const SizedBox();
    }
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 12),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: white,
          border: Border.symmetric(
              horizontal:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.equipment == null || widget.equipment!.name.isEmpty
                ? LocaleKeys.complectation.tr()
                : widget.equipment!.name,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18),
          ),
          const SizedBox(height: 8),
          ...List.generate(
              length, (index) => DotAndText(text: allOptions[index])),
          if (isCollapsable)
            WScaleAnimation(
              onTap: () {
                if (isCollapsed) {
                  length = allOptions.length;
                } else {
                  length = limit;
                }
                isCollapsed = !isCollapsed;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Показать все',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    isCollapsed ? AppIcons.chevronDown : AppIcons.chevronTop,
                    color: purple,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
