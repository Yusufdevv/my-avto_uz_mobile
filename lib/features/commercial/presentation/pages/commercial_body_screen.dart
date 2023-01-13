import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommercialBodyScreen extends StatelessWidget {
  final ScrollController scrollController;
  final bool? isNew;
  const CommercialBodyScreen(
      {required this.scrollController, this.isNew, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return ListView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        CommercialCarModelItem(
          title: 'Mercedes-Benz',
          subtitle: 'Sprinter',
          imageUrl: '',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WButton(
              onTap: () {},
              width: size.width * 0.45,
              borderRadius: 8,
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              border: Border.all(color: theme.dividerColorToGrey),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.filter,
                    color: orange,
                    height: 16,
                    width: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text('Параметры',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: orange)),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: warmerGrey,
                    radius: 10,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      color: white,
                      fit: BoxFit.cover,
                      height: 14,
                      width: 14,
                    ),
                  )
                ],
              ),
            ),
            WButton(
              onTap: () {},
              width: size.width * 0.45,
              borderRadius: 8,
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              border: Border.all(color: theme.dividerColorToGrey),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.location,
                    color: theme.darkToWhite,
                    height: 16,
                    width: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text('г. Ташкент',
                      style: Theme.of(context).textTheme.subtitle1),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: warmerGrey,
                    radius: 10,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      color: white,
                      fit: BoxFit.cover,
                      height: 14,
                      width: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoContainer(
              index: index,
              avatarPicture: 'assets/images/car_single/car_single300kb.png',
              carModel: 'Mercedes-Benz Sprinter',
              hasDiscount: false,
              location: 'г. Ташкент',
              owner: '',
              ownerType: '',
              publishTime: '',
              subtitle:
                  '\n\nMercedes-Benz Sprinter — семейство малотоннажных\nавтомобилей компании Mercedes-Benz. Существует...',
              year: 2020,
              price: '227 000 000 UZS',
              discountPrice: '270 000 000 UZS',
              sellType: 'b',
              hasStatusInfo: true,
              hasCallCard: true,
              gallery: [],
              currency: '',
              initialLike: false,
              onTapFavorites: () {},
              onTapComparsion: () {},
              initialComparsions: false,
              id: -1,
            ),
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}
