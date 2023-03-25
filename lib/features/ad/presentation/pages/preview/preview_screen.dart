import 'dart:typed_data';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_info_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_price_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/car_model_text.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/complectation_box.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/date_and_views_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/description_box.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/id_row.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/image_viewer.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/location_box_of_ad_preview.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewScreen extends StatelessWidget {
  final Uint8List? mapPointBodyBytes;
  final List<String> gallery;
  final List<String> panaramaGallery;
  final Map<int, String> selectedRadioOptions;
  final Map<int, SO> selectedSelectOptions;
  final EquipmentEntity? equipment;
  final bool registeredInUzbekistan;
  final bool isWaiting;

  final String makeName;
  final String modelName;
  final String generationName;
  final String price;
  final String currency;
  final String purchasedDate;
  final String? id;
  final String year;
  final String mileage;
  final String bodyType;
  final String colorName;
  final String modificationVolume;
  final String modificationPower;
  final String gearboxType;
  final String description;
  final String districtName;
  final String regionName;

  const PreviewScreen(
      {required this.mapPointBodyBytes,
      required this.gallery,
      required this.panaramaGallery,
      required this.makeName,
      required this.modelName,
      required this.generationName,
      required this.price,
      required this.currency,
      required this.purchasedDate,
      required this.year,
      required this.mileage,
      required this.bodyType,
      required this.colorName,
      required this.modificationVolume,
      required this.modificationPower,
      required this.equipment,
      required this.gearboxType,
      required this.selectedRadioOptions,
      required this.selectedSelectOptions,
      required this.registeredInUzbekistan,
      required this.description,
      required this.districtName,
      required this.regionName,
      this.isWaiting = false,
      this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (context) {
            if (isWaiting) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 80),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 12),
                  child: Text(
                    LocaleKeys.final_review.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                ImageViewer(images: [...gallery, ...panaramaGallery]),
                const SizedBox(height: 12),

                CarModelText(text: '$makeName $modelName $generationName'),
                CarPriceText(
                    text:
                        '${MyFunctions.getFormatCost(price.replaceAll(' ', ''))} ${currency.toUpperCase()}'),
                const SizedBox(height: 12),
                DateAndViewsRow(date: MyFunctions.getData(purchasedDate)),
                const SizedBox(height: 8),
                //
                if (id != null && id!.isNotEmpty) IdRow(id: id!),
                //
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Divider(
                        height: 1, color: Theme.of(context).dividerColor)),
                CarInfoRow(
                  title: LocaleKeys.years_of_issue.tr(),
                  info: year,
                ),
                if (mileage.isNotEmpty)
                  CarInfoRow(title: LocaleKeys.Mileage.tr(), info: mileage),
                CarInfoRow(title: LocaleKeys.body.tr(), info: bodyType),
                CarInfoRow(
                  title: LocaleKeys.color.tr(),
                  info: colorName,
                ),
                CarInfoRow(
                    title: LocaleKeys.complectation.tr(),
                    info: equipment?.name ?? LocaleKeys.not_shown.tr()),
                CarInfoRow(
                  title: LocaleKeys.engine_volume_l.tr(),
                  info: '$modificationVolume $modificationPower',
                ),
                CarInfoRow(
                  title: LocaleKeys.Transmission.tr(),
                  info: gearboxType,
                ),
                CarInfoRow(
                  title: LocaleKeys.rastamojen_v_uzbekistan.tr(),
                  info: registeredInUzbekistan
                      ? LocaleKeys.no.tr()
                      : LocaleKeys.yes.tr(),
                ),
                const SizedBox(height: 10),

                DescriptionBox(description: description),

                const SizedBox(height: 12),
                ComplectationBox(
                  equipment: equipment,
                  radios: selectedRadioOptions,
                  selects: selectedSelectOptions,
                ),

                const SizedBox(height: 12),

                LocationBoxOfAdPreview(
                  bodyBytes: mapPointBodyBytes,
                  districtName: districtName,
                  regionName: regionName,
                ),
              ],
            );
          },
        ),
      );
}
