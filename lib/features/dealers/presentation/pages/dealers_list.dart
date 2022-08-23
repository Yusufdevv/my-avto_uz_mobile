// import 'package:auto/assets/constants/icons.dart';
// import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/dealer_card.dart';
//
// class DealersList extends StatelessWidget {
//   DealersList({Key? key}) : super(key: key);
//   List<DealerCardEntity> cards = [
//     DealerCardEntity(
//       dealerType: 'showroom',
//       dealerName: 'orient motors',
//       dealerImageUrl: AppIcons.facebook,
//       carCount: 164,
//       workingHours: '9:00 - 21:00',
//       contractCode: '+998 97',
//       phoneNumber: '123 45 67',
//     ),
//     DealerCardEntity(
//       dealerType: 'person',
//       dealerName: 'orient motors',
//       dealerImageUrl: AppIcons.facebook,
//       carCount: 164,
//       workingHours: '9:00 - 21:00',
//       contractCode: '+998 97',
//       phoneNumber: '123 45 67',
//     ),
//     DealerCardEntity(
//       dealerType: 'showroom',
//       dealerName: 'orient motors',
//       dealerImageUrl: AppIcons.facebook,
//       carCount: 164,
//       workingHours: '9:00 - 21:00',
//       contractCode: '+998 97',
//       phoneNumber: '123 45 67',
//     ),
//     DealerCardEntity(
//       dealerType: 'showroom',
//       dealerName: 'orient motors',
//       dealerImageUrl: AppIcons.facebook,
//       carCount: 164,
//       workingHours: '9:00 - 21:00',
//       contractCode: '+998 97',
//       phoneNumber: '123 45 67',
//     ),
//     DealerCardEntity(
//       dealerType: 'showroom',
//       dealerName: 'orient motors',
//       dealerImageUrl: AppIcons.facebook,
//       carCount: 164,
//       workingHours: '9:00 - 21:00',
//       contractCode: '+998 97',
//       phoneNumber: '123 45 67',
//     )
//   ];
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: ListView.separated(
//           padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
//           itemBuilder: (context, index) => DealerCard(
//             dealerType: cards[index].dealerType,
//             dealerName: cards[index].dealerName,
//             dealerImageUrl: cards[index].dealerImageUrl,
//             quantityOfCars: cards[index].carCount,
//             workingHours: cards[index].workingHours,
//             contractCode: cards[index].contractCode,
//             contractNumber: cards[index].phoneNumber,
//           ),
//           separatorBuilder: (context, index) => const SizedBox(height: 16),
//           itemCount: cards.length,
//         ),
//       );
// }
