import 'package:auto/features/common/models/ad_model.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class TopAds extends StatelessWidget {
  const TopAds({
    required this.status,
    required this.topAds,
    Key? key,
  }) : super(key: key);
  final FormzStatus status;
  final List<AdModel> topAds;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              LocaleKeys.best_offers.tr(),
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 276,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => AdsItem(
                name: topAds[index].make,
                price: topAds[index].price.toString(),
                location: topAds[index].region,
                description: topAds[index].description,
                image: '',
              ),
              itemCount: 2,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
}
