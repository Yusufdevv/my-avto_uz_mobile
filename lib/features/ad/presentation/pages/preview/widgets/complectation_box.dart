import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/dot_and_text.dart';
import 'package:flutter/material.dart';

class ComplectationBox extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (!(((equipment?.options.length ?? 0) + radios.length + selects.length) >
        0)) {
      return const SizedBox();
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
          Text(equipment?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18)),
          const SizedBox(height: 8),
          if (equipment != null) ...{
            ...equipment!.options
                .map((e) => DotAndText(text: e.option.name))
                .toList()
          },
          ...selects.entries
              .map((e) => DotAndText(text: e.value.optionName))
              .toList(),
          ...radios.entries.map((e) => DotAndText(text: e.value))
        ],
      ),
    );
  }
}
