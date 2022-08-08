import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/owner_action.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_info_tile.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class VinInfoList extends StatelessWidget {
  const VinInfoList({Key? key}) : super(key: key);

  static const List<OwnerActionEntity> list = [
    OwnerActionEntity(
        icon: AppIcons.bell, title: 'Характеристики совпадают с ПТС'),
    OwnerActionEntity(icon: AppIcons.bell, title: '1 владелец в ПТС'),
    OwnerActionEntity(
        icon: AppIcons.bell, title: '12 записей в истории эксплутации'),
    OwnerActionEntity(icon: AppIcons.bell, title: 'Поиск данных о залоге'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        color: dark1,
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Отчёт о проверке по VIN',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            ...List.generate(
                list.length, (index) => VinInfoTile(entity: list[index])),
            const VinInfoTile(
                entity: OwnerActionEntity(
                    title: 'Ещё 20 пунктов проверки',
                    icon: AppIcons.chevronDown)),
            const SizedBox(
              height: 10,
            ),
            WButton(
              text: 'Купить полный отчёт',
              textColor: Colors.white,
              onTap: () {},
              color: orange,
              height: 36,
              borderRadius: 8,
            ),
            const SizedBox(height: 8,),
            WButton(
              text: 'Показать бесплатный отчёт',
              textColor: grey,
              onTap: () {},
              color: const Color(0xff373737),
              height: 36,
              borderRadius: 8,
            ),
          ],
        ),
      );
}
