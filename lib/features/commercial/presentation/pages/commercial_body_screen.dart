import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:flutter/material.dart';

class CommercialBodyScreen extends StatelessWidget {
  CommercialBodyScreen({super.key});
  final List<bool> hasDiscount = [true, false];
  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];
  final List<String> ownerType = ['Частное лицо', 'Автосалон'];
  final List<String> publishTime = ['Сегодня', '27 февраля'];
  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 20),
        // CommercialCarModelItem(title: 'Mercedes-Benz', subtitle: 'Sprinter'),
        // SizedBox(height: 12),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     WButton(
        //       onTap: () =>
        //           Navigator.push(context, fade(page: const FilterScreen())),
        //       width: size.width * 0.45,
        //       borderRadius: 8,
        //       margin: const EdgeInsets.only(left: 16),
        //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        //       border: Border.all(color: theme.dividerColorToGrey),
        //       color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        //       child: Row(
        //         children: [
        //           SvgPicture.asset(
        //             AppIcons.filter,
        //             color: orange,
        //             height: 16,
        //             width: 16,
        //             fit: BoxFit.cover,
        //           ),
        //           SizedBox(width: 8),
        //           Text('Параметры',
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .subtitle1!
        //                   .copyWith(color: orange)),
        //           Spacer(),
        //           CircleAvatar(
        //             backgroundColor: warmerGrey,
        //             radius: 10,
        //             child: SvgPicture.asset(
        //               AppIcons.close,
        //               color: white,
        //               fit: BoxFit.cover,
        //               height: 14,
        //               width: 14,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     WButton(
        //       onTap: () =>
        //           Navigator.push(context, fade(page: const FilterScreen())),
        //       width: size.width * 0.45,
        //       borderRadius: 8,
        //       margin: const EdgeInsets.only(right: 16),
        //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        //       border: Border.all(color: theme.dividerColorToGrey),
        //       color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        //       child: Row(
        //         children: [
        //           SvgPicture.asset(
        //             AppIcons.location,
        //             color: theme.darkToWhite,
        //             height: 16,
        //             width: 16,
        //             fit: BoxFit.cover,
        //           ),
        //           SizedBox(width: 8),
        //           Text('г. Ташкент',
        //               style: Theme.of(context).textTheme.subtitle1),
        //           Spacer(),
        //           CircleAvatar(
        //             backgroundColor: warmerGrey,
        //             radius: 10,
        //             child: SvgPicture.asset(
        //               AppIcons.close,
        //               color: white,
        //               fit: BoxFit.cover,
        //               height: 14,
        //               width: 14,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) => Divider(
                height: 12, thickness: 0, color: theme.borderGreyToDark),
            itemBuilder: (context, index) => InfoContainer(
              avatarPicture: 'assets/images/car_single/car_single300kb.png',
              carModel: 'Mercedes-Benz Sprinter',
              hasDiscount: hasDiscount[index],
              location: 'г. Ташкент',
              owner: owner[index],
              ownerType: ownerType[index],
              publishTime: publishTime[index],
              subtitle:
                  '\n\nMercedes-Benz Sprinter — семейство малотоннажных\nавтомобилей компании Mercedes-Benz. Существует...',
              year: 2020,
              price: '227 000 000 UZS',
              discountPrice: '270 000 000 UZS',
              sellType: sellType[index],
              hasStatusInfo: hasDiscount[index],
              hasCallCard: hasDiscount[index],
            ),
          ),
        ),
      ],
    );
  }
}
