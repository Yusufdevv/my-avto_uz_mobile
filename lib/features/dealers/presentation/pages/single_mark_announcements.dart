import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/presentation/widgets/all_commertial_item.dart';
import 'package:flutter/material.dart';

class SingleMarkAnnouncements extends StatelessWidget {
  SingleMarkAnnouncements({Key? key}) : super(key: key);
  final List<CommercialItemEntity> commercialItemEntity = [
    const CommercialItemEntity(
      autoName: 'Genesis',
      autoYear: 2020,
      clientName: 'Анвар Гулямов',
      title:
          'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует...',
      priceAuto: '227 000 000 UZS',
      oldPriceAuto: '',
      clientAvatar:
          'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
      isSalon: true,
      isLike: true,
      model: '',
      images: [
        'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          extraActions: [
            Text('Genesis',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(
              flex: 120,
            ),
          ],
        ),
        body: ListView(shrinkWrap: true, children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: 1,
            itemBuilder: (context, index) => AllCommercialItem(
              commercialItemEntity: commercialItemEntity[index],
              hasMilage: false,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: 1,
            itemBuilder: (context, index) => AllCommercialItem(
              commercialItemEntity: commercialItemEntity[index],
              hasMilage: false,
            ),
          ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   padding: const EdgeInsets.all(12),
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) => Container(
          //     height: 201,
          //     width: 264,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               'https://4x4.media/61502-brabus-900-superblack-nemeckij-tyuner-sdelal-eshyo-odin-900-silnyj-amg-g63.html')),
          //     ),
          //   ),
          //   itemCount: 4,
          // )
        ]),
      );
}
