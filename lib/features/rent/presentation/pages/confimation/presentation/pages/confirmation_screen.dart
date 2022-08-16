import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/single_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/details_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/milage_price_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/place_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/requirement_item.dart';
import 'package:auto/features/rent/presentation/pages/registration_lease/presentation/pages/registration_lease.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/car_single_preview.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {  final List<SingleCarsEntity> singleCars = [
  const SingleCarsEntity(
    carModel:
    'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
    price: '1000000',
    images: [
      'https://ag-spots-2021.o.auroraobjects.eu/2021/07/28/mercedes-amg-cls-63-s-c218-2016-c146928072021222031_3.jpg?1627503639',
      'https://www.chicagomotorcars.com/imagetag/6450/main/l/Used-2016-Mercedes-Benz-CLS63-AMG-S-4MATIC-Sedan-MSRP-115K-PREMIUM-PACKAGE.jpg',
      'https://www.chicagomotorcars.com/imagetag/6450/22/l/Used-2016-Mercedes-Benz-CLS63-AMG-S-4MATIC-Sedan-MSRP-115K-PREMIUM-PACKAGE.jpg',
      'https://ag-spots-2021.o.auroraobjects.eu/2021/07/28/mercedes-amg-cls-63-s-c218-2016-c146928072021222031_3.jpg?1627503639',
      'https://www.chicagomotorcars.com/imagetag/6450/main/l/Used-2016-Mercedes-Benz-CLS63-AMG-S-4MATIC-Sedan-MSRP-115K-PREMIUM-PACKAGE.jpg',
      'https://i.ytimg.com/vi/QTGtcgzQx5w/maxresdefault.jpg',
      'https://ag-spots-2018.o.auroraobjects.eu/2018/10/07/mercedes-benz-cls-63-amg-c218-c156007102018194510_1.jpg',
      'https://i.pinimg.com/originals/07/ea/d5/07ead57d1cef4daf279c9a889347c685.jpg'
    ],
    yearIssue: '2019',
    mileage: '98000',
    carCase: 'Седан',
    color: 'Черный \n(металлик)',
    equipment: 'Luxury',
    sizeMotor: '2.1',
    gearboxType: 'Механика',
    hasFreezer: false,
    driveUnit: 'Полный',
  )
];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const WAppBar(
      title: 'Подтверждение',
      centerTitle: false,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          CarSinglePreview(singleCarsEntity: singleCars[0], hasCarInfo: false,),
          const RequirementItem(age: '16', experience: '2',),
          const DetailsItem(),
          const MileagePriceItem(),
          const PlaceItem(),
        ],
      ),
    ),
    bottomNavigationBar: WButton(
      height: 44,
      onTap: () => Navigator.push(context, fade(page: const RegistrationLeaseScreen())),
      margin: EdgeInsets.fromLTRB(
          16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
      text: 'Оформить заказ',
      shadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: orange.withOpacity(0.2)),
      ],
    ),

  );
}
