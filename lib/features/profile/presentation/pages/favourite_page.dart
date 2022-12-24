import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/domain/entities/favourite_entity.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({ this.favoriteEntity,Key? key}) : super(key: key);
  final List<FavoriteEntity>? favoriteEntity;
  final List<CommercialItemEntity> commercialItemEntity = [
    // const CommercialItemEntity(
    //   autoName: 'Mercedes-Benz Sprinter',
    //   autoYear: 2020,
    //   clientName: 'Анвар Гулямов',
    //   title:
    //       'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует...',
    //   priceAuto: '227 000 000 UZS',
    //   oldPriceAuto: '270 000 000 UZS',
    //   clientAvatar:
    //       'https://images.unsplash.com/photo-1659880233848-1f4eaf4f753c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    //   isSalon: false,
    //   isLike: true,
    //   model: '',
    //   images: [
    //     'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    //   ],
    // ),
  ];


  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: WAppBar(
          title: LocaleKeys.favorites.tr(),
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: favoriteEntity?.length,
          itemBuilder: (context, index) => Column(
            children: [
              // ...List.generate(
              //   commercialItemEntity.length,
              //   (index) => AllCommercialItem(
              //     commercialItemEntity: commercialItemEntity[index],
              //   ),
              // ),
            ],
          ),
        ),
      );
}
