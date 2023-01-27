import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_info_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_price_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/date_and_views_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/id_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/image_viewer.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key}) : super(key: key);

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
                ImageViewer(images: state.gallery),
                const SizedBox(height: 12),
                CarModelText(
                    text:
                        '${state.makes[state.makes.indexWhere((element) => element.id == state.makeId)]}'),
                CarPriceText(text: '${state.price}'),
                const SizedBox(height: 12),
                DateAndViewsRow(date: state.purchasedDate!),
                const SizedBox(height: 8),
                IdRow(id: state.id ?? ''),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Divider(
                        height: 1, color: Theme.of(context).dividerColor)),
                CarInfoRow(
                    title: LocaleKeys.years_of_issue.tr(),
                    info:
                        '${state.years?.firstWhere((element) => state.yearId == element.id).yearBegin}'),
                CarInfoRow(title: LocaleKeys.Mileage, info: '${state.mileage}'),
                CarInfoRow(
                    title: LocaleKeys.body.tr(),
                    info: state.bodyTypes.isEmpty
                        ? 'not selected'
                        : state.bodyTypes
                            .firstWhere((e) => e.id == state.bodyTypeId)
                            .type),
                CarInfoRow(
                  title: LocaleKeys.color.tr(),
                  info: '${state.colorName}',
                ),
                 CarInfoRow(title: LocaleKeys.complectation.tr(), info: 'hsergfd'),
                CarInfoRow(
                  title: LocaleKeys.engine_volume_l.tr(),
                  info:
                      '${state.years?.firstWhere((element) => state.yearId == element.id).yearBegin}',
                ),
                CarInfoRow(
                  title: LocaleKeys.Transmission.tr(),
                  info: state.gearBoxes.isEmpty
                      ? 'not selected'
                      : state.gearBoxes
                          .firstWhere((e) => e.id == state.gearboxId)
                          .type,
                ),
                CarInfoRow(
                  title: 'Растаможен в Узбекистане',
                  info: state.notRegisteredInUzbekistan ? LocaleKeys.no.tr() : 'Да',
                ),
                const SizedBox(height: 36)
              ],
            ),
          ),
        ),
      );
}
