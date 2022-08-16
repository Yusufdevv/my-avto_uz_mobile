import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/options_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/options_item.dart';
import 'package:flutter/material.dart';

class AdditionalOptions extends StatefulWidget {
  const AdditionalOptions({Key? key}) : super(key: key);

  @override
  State<AdditionalOptions> createState() => _AdditionalOptionsState();
}

class _AdditionalOptionsState extends State<AdditionalOptions> {
  final List<OptionsEntity> optionsEntity = [
    const OptionsEntity(title: 'Помытая машина', hasOption: true),
    const OptionsEntity(title: 'Детское кресло', hasOption: false),
    const OptionsEntity(title: 'Полный бак бензина', hasOption: false),
  ];
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
      border: Border.all(width: 1, color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Дополнительные опции', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
        const SizedBox(height: 8,),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          direction: Axis.horizontal,
          children: [
            ...List.generate(optionsEntity.length, (index) => OptionsItem(optionsEntity: optionsEntity[index],),),
          ],
        ),
      ],
    ),
  );
}
