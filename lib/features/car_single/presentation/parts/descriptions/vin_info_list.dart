// import 'package:auto/assets/colors/color.dart';
// import 'package:auto/assets/constants/icons.dart';
// import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
// import 'package:auto/features/car_single/domain/entities/owner_action.dart';
// import 'package:auto/features/car_single/presentation/widgets/vin_info_tile.dart';
// import 'package:auto/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class VinInfoList extends StatelessWidget {
//   const VinInfoList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
//           border: Border.all(
//             color: border,
//           ),
//         ),
//         padding:
//             const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               LocaleKeys.VIN_check_report.tr(),
//               style: Theme.of(context)
//                   .textTheme
//                   .displayLarge!
//                   .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ...List.generate(
//                 list.length, (index) => VinInfoTile(entity: list[index])),
//             if (list.length >= 4)
//               GestureDetector(
//                 child:   VinInfoTile(
//                     entity: OwnerActionEntity(
//                   title: '',
//                   icon: AppIcons.chevronRound,
//                 )),
//               )
//             else
//               const SizedBox(),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             // WlabelLarge(
//             //   text: LocaleKeys.buy_full_report.tr(),
//             //   textColor: Colors.white,
//             //   onTap: () {},
//             //   color: orange,
//             //   height: 36,
//             //   borderRadius: 8,
//             // ),
//             // const SizedBox(
//             //   height: 8,
//             // ),
//             // WlabelLarge(
//             //   text: LocaleKeys.show_free_report.tr(),
//             //   textColor: grey,
//             //   onTap: () {},
//             //   color: Theme.of(context)
//             //       .extension<ThemedColors>()!
//             //       .solitudeToEclipse,
//             //   height: 36,
//             //   borderRadius: 8,
//             // ),
//           ],
//         ),
//       );
// }
