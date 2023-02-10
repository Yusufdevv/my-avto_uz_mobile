import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart'; 
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart'; 
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class TopBrands extends StatelessWidget {
  final bool isText;
  final ValueChanged<MakeEntity> onTap;
  const TopBrands({
    required this.onTap,
    this.isText = true,
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
              if (isText)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(LocaleKeys.top_marks.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18))),
              Container(
                color: white,
                height: isText ? 124 : 132,
                child: Paginator(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  padding: EdgeInsets.only(
                      left: 16, right: 16, top: isText ? 8 : 16, bottom: 16),
                  scrollDirection: Axis.horizontal,
                  paginatorStatus: state.status,
                  itemBuilder: (context, index) => CarBrandItem(
                    carBrandEntity: state.brands[index],
                    hasShadow: true,
                    onTap: () {
                      onTap(state.brands[index]);
                    },
                  ),
                  itemCount: state.brands.length,
                  fetchMoreFunction: () {
                    context
                        .read<TopBrandBloc>()
                        .add(TopBrandEvent.getMoreBrand());
                  },
                  hasMoreToFetch: state.next != null,
                  errorWidget: const SizedBox(),
                  loadingWidget: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: isText ? 8 : 16, bottom: 16),
                    itemCount: 5,
                    itemBuilder: (context, index) => BrandShimmerItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
