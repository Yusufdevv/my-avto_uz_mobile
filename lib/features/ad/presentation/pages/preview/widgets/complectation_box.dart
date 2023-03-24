import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/dot_and_text.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    if (widget.equipment != null) {
      allOptions.addAll(widget.equipment!.options.map((e) => e.option.name));
    }
    allOptions
      ..addAll(widget.selects.entries.map((e) => e.value.optionName))
      ..addAll(widget.radios.entries.map((e) => e.value));
  }

  @override
  Widget build(BuildContext context) {
    if (!(((widget.equipment?.options.length ?? 0) +
            widget.radios.length +
            widget.selects.length) >
        0)) {
      return Divider(
          height: 1, thickness: 1, color: Theme.of(context).dividerColor);
    }
    return Container(
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
                  .copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          ...allOptions.map((e) => DotAndText(text: e)).toList()
        ],
      ),
    );
  }
}
