import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TopBrandBloc, TopBrandState>(
        builder: (context, state) => Visibility(
          visible: state.status.isSubmissionInProgress ||
              state.status.isSubmissionSuccess && state.brands.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  LocaleKeys.top_marks.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Theme.of(context).dialogBackgroundColor,
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      state.status.isSubmissionInProgress
                          ? BrandShimmerItem()
                          : CarBrandItem(
                              carBrandEntity: state.brands[index],
                              hasShadow: true,
                            ),
                  itemCount: state.status.isSubmissionInProgress
                      ? 5
                      : state.brands.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                ),
              ),
            ],
          ),
        ),
      );
}
