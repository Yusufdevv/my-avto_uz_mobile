import 'package:auto/features/common/models/ad_model.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class TopAds extends StatelessWidget {
  const TopAds({
    required this.status,
    required this.topAds,
    required this.onTapLike,
    Key? key,
  }) : super(key: key);
  final FormzStatus status;
  final List<AdModel> topAds;
  final Function(int index) onTapLike;

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
              itemBuilder: (context, index) => status.isSubmissionInProgress
                  ? BrandShimmerItem()
                  : AdsItem(
                      name: topAds[index].make,
                      price: topAds[index].price.toString(),
                      location: topAds[index].region,
                      description: topAds[index].description,
                      image: topAds[index].gallery.isNotEmpty
                          ? topAds[index].gallery.first
                          : '',
                      currency: topAds[index].currency,
                      isLiked: topAds[index].isWishlisted,
                      onTapLike: () => onTapLike(index),
                    ),
              itemCount: status.isSubmissionInProgress ? 5 : topAds.length,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
}
