import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/main/data/models/top_brand.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({
    required this.status,
    required this.brands,
    Key? key,
  }) : super(key: key);

  final FormzStatus status;
  final List<TopBrandModel> brands;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              LocaleKeys.top_marks.tr(),
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => status.isSubmissionInProgress
                  ? BrandShimmerItem()
                  : CarBrandItem(
                      carBrandEntity: brands[index],
                      hasShadow: true,
                    ),
              itemCount: status.isSubmissionInProgress ? 5 : brands.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
        ],
      );
}
