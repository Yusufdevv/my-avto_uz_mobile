import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageTypeInfoSheet extends StatelessWidget {
  final infos = [
    'Практически как новое и не требует никаких доработок, или поправок.',
    'Данный элемент был заменен на другой',
    // 'Не новое, но и не имеется потребность к замене или ремонтированию',
    'Имеются не значительные вмятины',
    'Имеются определённқе повреждения и советуеся ремон, или замена',
    'Состояние плохое, ремонт сильно не поможет, трубется замена',
  ];
  @override
  Widget build(BuildContext context) => Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 60),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Информация',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    GestureDetector(
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
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  shrinkWrap: true,
                  itemCount: DamageType.values.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: border, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            WarningCircleWidget(
                                damageType: DamageType.values[index]),
                            const SizedBox(width: 12),
                            Text(
                              MyFunctions.getStatusTitle(
                                  DamageType.values[index].value),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          infos[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .darkGreyToWhite),
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              ),
              WButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                color: orange,
                text: 'Понятно',
                textStyle: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: white),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                  top: 20,
                  left: 16,
                  right: 16,
                ),
              ),
            ],
          ),
        ),
      );
}
