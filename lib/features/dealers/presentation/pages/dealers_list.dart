import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/dealers/domain/entities/models/dealer_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/dealer_card.dart';

class DealersList extends StatelessWidget {
  DealersList({Key? key}) : super(key: key);
  List<DealerCardModel> cards = [
    DealerCardModel(
      dealerType: 'showroom',
      dealerName: 'orient motors',
      dealerImageUrl: AppIcons.facebook,
      quantityOfCars: 164,
      workingHours: '9:00 - 21:00',
      contractCode: '+998 97',
      contractNumber: '123 45 67',
    ),
    DealerCardModel(
      dealerType: 'person',
      dealerName: 'orient motors',
      dealerImageUrl: AppIcons.facebook,
      quantityOfCars: 164,
      workingHours: '9:00 - 21:00',
      contractCode: '+998 97',
      contractNumber: '123 45 67',
    ),
    DealerCardModel(
      dealerType: 'showroom',
      dealerName: 'orient motors',
      dealerImageUrl: AppIcons.facebook,
      quantityOfCars: 164,
      workingHours: '9:00 - 21:00',
      contractCode: '+998 97',
      contractNumber: '123 45 67',
    ),
    DealerCardModel(
      dealerType: 'showroom',
      dealerName: 'orient motors',
      dealerImageUrl: AppIcons.facebook,
      quantityOfCars: 164,
      workingHours: '9:00 - 21:00',
      contractCode: '+998 97',
      contractNumber: '123 45 67',
    ),
    DealerCardModel(
      dealerType: 'showroom',
      dealerName: 'orient motors',
      dealerImageUrl: AppIcons.facebook,
      quantityOfCars: 164,
      workingHours: '9:00 - 21:00',
      contractCode: '+998 97',
      contractNumber: '123 45 67',
    )
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: List.generate(
              cards.length,
              (index) => DealerCard(
                dealerType: cards[index].dealerType,
                dealerName: cards[index].dealerName,
                dealerImageUrl: cards[index].dealerImageUrl,
                quantityOfCars: cards[index].quantityOfCars,
                workingHours: cards[index].workingHours,
                contractCode: cards[index].contractCode,
                contractNumber: cards[index].contractNumber,
              ),
            ),
          ),
        ),
      );
}
