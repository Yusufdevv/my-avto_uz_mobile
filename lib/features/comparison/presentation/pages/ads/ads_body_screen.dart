import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:flutter/material.dart';

class AdsBodyScreen extends StatelessWidget {
  AdsBodyScreen({super.key});
  final List<bool> hasDiscount = [true, false];
  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];
  final List<String> ownerType = ['Частное лицо', 'Автосалон'];
  final List<String> publishTime = ['Сегодня', '27 февраля'];
  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        CommercialCarModelItem(
          title: 'Mercedes-Benz',
          subtitle: 'asdd',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.filter,
                name: '',
                claerA: false,
                activeColor: orange,
                defaultTitle: 'Параметры',
                onTap: () {},
                onTapClear: () {},
              ),
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.location,
                name: 'г. Ташкент',
                claerA: true,
                activeColor: dark,
                defaultTitle: 'Все регионы',
                onTap: () {},
                onTapClear: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoContainer(
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
              onTapComparsion: () {},
              onTapFavorites: () {},
            ),
          ),
        )
      ],
    );
  }
}
