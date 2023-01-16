import 'package:auto/features/ad/domain/entities/preview/preview_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_info_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_price_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/date_and_views_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/id_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({Key? key}) : super(key: key);

  final List<PreviewEntity> previews = [
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
        body: BlocBuilder<PostingAdBloc, PostingAdState>(
          builder: (context, state) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 12),
                  child: Text(
                    'Финальный предосмотр',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                ImageViewer(images: previews[0].images),
                const SizedBox(height: 12),
                CarModelText(text: previews[0].carModel),
                CarPriceText(text: previews[0].price),
                const SizedBox(height: 12),
                DateAndViewsRow(previews: previews),
                const SizedBox(height: 8),
                IdRow(previews: previews),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Divider(
                        height: 1, color: Theme.of(context).dividerColor)),
                CarInfoRow(
                    title: 'Год выпуска',
                    info: '${state.yearsEntity?.yearBegin}'),
                CarInfoRow(title: 'Пробег', info: '${state.mileage}'),
                CarInfoRow(
                    title: 'Кузов',
                    info: state.bodyTypes.isEmpty
                        ? 'not selected'
                        : state.bodyTypes
                            .firstWhere((e) => e.id == state.bodyTypeId)
                            .type),
                CarInfoRow(
                  title: 'Цвет',
                  info: '${state.colorName}',
                ),
                const CarInfoRow(title: 'Комплектация', info: 'hsergfd'),
                CarInfoRow(
                  title: 'Объем двигателя, л',
                  info: '${state.yearsEntity?.yearBegin ?? 'hsergfd'}',
                ),
                CarInfoRow(
                  title: 'Коробка передач',
                  info: state.gearBoxes.isEmpty
                      ? 'not selected'
                      : state.gearBoxes
                          .firstWhere((e) => e.id == state.gearboxId)
                          .type,
                ),
                CarInfoRow(
                  title: 'Растаможен в Узбекистане',
                  info: state.isRastamojen ? 'Да' : 'Нет',
                ),
                const SizedBox(height: 36)
              ],
            ),
          ),
        ),
      );
}
