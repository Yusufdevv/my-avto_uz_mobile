import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
  List<String> chunckOfOptions = [];
  final l = 6;

  @override
  void initState() {
    super.initState();

    if (widget.equipment != null) {
      allOptions.addAll(widget.equipment!.options.map((e) => e.option.name));
    }
    allOptions
      ..addAll(widget.selects.entries.map((e) => e.value.optionName))
      ..addAll(widget.radios.entries.map((e) => e.value));
    if (allOptions.length > l) {
      chunckOfOptions = allOptions.getRange(0, l).toList();
    } else {
      chunckOfOptions = allOptions;
    }
  }

  bool get isCollapsed => chunckOfOptions.length != allOptions.length;

  @override
  Widget build(BuildContext context) {
    if (!(((widget.equipment?.options.length ?? 0) +
            widget.radios.length +
            widget.selects.length) >
        0)) {
      return Divider(
          height: 1, thickness: 1, color: Theme.of(context).dividerColor);
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
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
          ...chunckOfOptions.map((e) => DotAndText(text: e)).toList(),
          WScaleAnimation(
            onTap: () {
              if (isCollapsed) {
                chunckOfOptions = allOptions;
              } else {
                chunckOfOptions = allOptions.getRange(0, l).toList();
              }
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
