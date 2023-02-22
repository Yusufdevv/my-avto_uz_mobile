// import 'package:auto/assets/colors/color.dart';
// import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
// import 'package:auto/features/main/presentation/widgets/ads_item.dart';
// import 'package:auto/features/pagination/presentation/paginator.dart';
// import 'package:auto/generated/locale_keys.g.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:formz/formz.dart';
//
// class OtherAds extends StatelessWidget {
//   final String model;
//   final String logo;
//   final List<String> name;
//   final List<String> price;
//   final List<String> location;
//   final List<String> image;
//   final List<String> description;
//   final int length;
//   final bool hasFetchMore;
//   final FormzStatus status;
//
//   const OtherAds(
//       {Key? key,
//       required this.name,
//       required this.price,
//       required this.location,
//       required this.description,
//       required this.length,
//       required this.image,
//       required this.model,
//       required this.logo,
//       required this.hasFetchMore,
//       required this.status})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Container(
//         padding: const EdgeInsets.only(
//           bottom: 20,
//         ),
//         decoration: BoxDecoration(
//             color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
//             border: Border.all(color: border)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 LocaleKeys.Other_announcements.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .displayLarge!
//                     .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Theme.of(context)
//                     .extension<ThemedColors>()!
//                     .solitudeTo1Black,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.all(2),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   Text(
//                     model,
//                     style: Theme.of(context)
//                         .textTheme
//                         .displayLarge!
//                         .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(
//                     width: 28,
//                   ),
//                   Container(
//                     width: 50,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(7.5),
//                         color: Theme.of(context)
//                             .extension<ThemedColors>()!
//                             .whiteToEclipse,
//                         border: Border.all(color: border)),
//                     height: 36,
//                     child: Center(
//                       child: CachedNetworkImage(
//                         imageUrl: logo,
//                         errorWidget: (context, url, error) => const SizedBox(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Paginator(
//                     paginatorStatus: status,
//                     itemBuilder: (BuildContext context, int index) => AdsItem(
//                       name: name[index],
//                       price: price,
//                       location: location,
//                       description: description,
//                       image: image,
//                     ),
//                     itemCount: length,
//                     fetchMoreFunction: () {},
//                     hasMoreToFetch: hasFetchMore,
//                     errorWidget: Container(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
// }
