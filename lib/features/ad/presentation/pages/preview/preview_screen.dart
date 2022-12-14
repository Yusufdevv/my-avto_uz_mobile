import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/preview/preview_entity.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/preview_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/my_ad_screen.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({Key? key}) : super(key: key);

  final List<PreviewEntity> preview = [
    PreviewEntity(
        carModel:
            'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
        price: '123 488 000 000 ',
        date: '2 февраля 2021',
        seenItem: '31 490',
        id: '8323543',
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
        seenToday: '629')
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        children: [
          PreviewItem(
            previewEntity: preview[0],
          ),
          Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              right: 16,
              left: 16,
              child: WButton(
                onTap: () async {
                  Navigator.pop(context);
                  HomeTabControllerProvider.of(context).controller.animateTo(4);

                  Navigator.push(context, fade(page: const MyAdScreen()));
                },
                text: 'Разместить бесплатно на 7 дней....',
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: orange.withOpacity(0.2)),
                ],
              )),
        ],
      ));
}
