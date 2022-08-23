import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/presentation/pages/filter_screen.dart';
import 'package:auto/features/search/presentation/widgets/all_commertial_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultsScreen extends StatefulWidget {
  final TextEditingController controller;

  const ResultsScreen({required this.controller, Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final List<CommercialItemEntity> commercialItemEntity = [
    const CommercialItemEntity(
      model: 'Sprinter',
      autoName: 'Mercedes-Benz Sprinter',
      autoYear: 2020,
      clientName: 'Анвар Гулямов',
      title:
          'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует...',
      priceAuto: '227 000 000 UZS',
      oldPriceAuto: '270 000 000 UZS',
      clientAvatar:
          'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      isSalon: false,
      isLike: true,
      images: [
        'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: WAppBar(
        height: 76,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: dark.withOpacity(.08),
          ),
          BoxShadow(
            offset: const Offset(0, -1),
            color: dark.withOpacity(.08),
          ),
        ],
        hasBackButton: false,
        extraActions: [
          WTextField(
            fillColor: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteSmoke2ToNightRider,
            focusColor: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteSmoke2ToNightRider,
            enabledBorderColor: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteSmoke2ToNightRider,
            onChanged: (value) {
              setState(() {});
            },
            height: 44,
            margin: const EdgeInsets.only(top: 15),
            width: 300,
            borderRadius: 12,
            controller: widget.controller,
            hasSearch: true,
            hintText: 'Марка, Модель',
            hasClearButton: true,
          ),
          const Spacer(),
          WButton(
            onTap: () =>
                Navigator.push(context, fade(page: const FilterScreen())),
            width: 44,
            height: 44,
            borderRadius: 12,
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteSmoke2ToNightRider,
            child: SvgPicture.asset(AppIcons.filter),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              commercialItemEntity.length,
              (index) => AllCommercialItem(
                commercialItemEntity: commercialItemEntity[index],
              ),
            ),
          ],
        ),
      ));
}
