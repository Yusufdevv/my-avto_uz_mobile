import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/radio_circle_widget.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageTypeChooseSheet extends StatefulWidget {
  final String title;
  final DamageType? initialType;
  const DamageTypeChooseSheet(
      {required this.title, required this.initialType, super.key});

  @override
  State<DamageTypeChooseSheet> createState() => _DamageTypeChooseSheetState();
}

class _DamageTypeChooseSheetState extends State<DamageTypeChooseSheet> {
  DamageType? selected;

  @override
  void initState() {
    selected = widget.initialType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Состояние кузова',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  GestureDetector(
                        behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: border, thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            ...List.generate(
                DamageType.values.length,
                (index) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          setState(() => selected = DamageType.values[index]),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(
                            left: 16, bottom: 10, right: 16),
                        decoration: BoxDecoration(
                          color: selected == DamageType.values[index]
                              ? purple.withOpacity(.1)
                              : null,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            WarningCircleWidget(
                              damageType: DamageType.values[index],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              MyFunctions.getStatusTitle(
                                  DamageType.values[index].value),
                              style: DamageType.values[index] == selected
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 16)
                                  : Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: LightThemeColors.smoky),
                            ),
                            const Spacer(),
                            RadioCircleWidget(
                                selected: DamageType.values[index] == selected)
                          ],
                        ),
                      ),
                    )),
            WButton(
              onTap: () {
                Navigator.of(context).pop(selected);
              },
              color: orange,
              text: 'Сохранить',
              textStyle:
                  Theme.of(context).textTheme.titleMedium!.copyWith(color: white),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                top: 20,
                left: 16,
                right: 16,
              ),
            ),
          ],
        ),
      );
}
