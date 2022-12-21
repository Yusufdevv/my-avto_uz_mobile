import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/paginator2.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/features/search/presentation/widgets/search_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) => Paginator2(
          hasMoreToFetch: state.count > state.list.length,
          separatorBuilder: (context, index) => Divider(
            height: 12,
            thickness: 0,
            color:
                Theme.of(context).extension<ThemedColors>()!.borderGreyToDark,
          ),
          itemBuilder: (context, index) => state.list.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: border,
                          borderRadius: BorderRadius.circular(150),
                        ),
                        height: 92,
                        width: 92,
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          AppImages.noItemFoundCar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Ничего не найдено',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          // InfoResultContainer(
          //     gallery: [],
          //     carModelName: state.list[index].model.name,
          //     carYear: state.list[index].,
          //     contactPhone: state.list[index].,
          //     description: description,
          //     districtTitle: districtTitle,
          //     isNew: isNew,
          //     isWishlisted: isWishlisted,
          //     price: price,
          //     publishedAt: publishedAt,
          //     userFullName: userFullName,
          //     userImage: userImage,
          //     userType: userType),
          fetchMoreFunction: () {},
          status: state.status,
          itemCount: state.list.length,
          errorWidget: const SizedBox(),
          loadingLabel: 'Загрузка данных...',
          loadingIndicator: const SearchItemShimmer(slideImageCount: 4),
        ),
      );
}
