// import 'package:auto/features/common/widgets/w_app_bar.dart';
// import 'package:auto/features/profile/domain/entities/favourite_entity.dart';
// import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
// import 'package:auto/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class FavouritePage extends StatelessWidget {
//   FavouritePage({ this.favoriteEntity,Key? key}) : super(key: key);
//   final List<FavoriteEntity>? favoriteEntity;
//   final List<CommercialItemEntity> commercialItemEntity = [
    
//   ];


//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         appBar: WAppBar(
//           title: LocaleKeys.favorites.tr(),
//           centerTitle: false,
//         ),
//         body: ListView.builder(
//           itemCount: favoriteEntity?.length,
//           itemBuilder: (context, index) => Column(
//             children: [
//               ...List.generate(
//                 commercialItemEntity.length,
//                 (index) => AllCommercialItem(
//                   commercialItemEntity: commercialItemEntity[index],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
