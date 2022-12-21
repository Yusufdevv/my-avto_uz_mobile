import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/search/data/datasources/search_results_datasource.dart';
import 'package:auto/features/search/data/repositories/search_repository.dart';
import 'package:auto/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:auto/features/search/presentation/bloc/search_results/search_result_bloc.dart';
import 'package:auto/features/search/presentation/part/sort_modal_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/commercial_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class ResultsScreen extends StatefulWidget {
  final TextEditingController controller;

  const ResultsScreen({required this.controller, Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late SearchResultBloc resultBloc;

  @override
  void initState() {
    resultBloc = SearchResultBloc(GetSearchResultsUseCase(
        repo: SearchRepositoryImpl(
            dataSource: SearchResultsDatasourceImpl(DioSettings().dio))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: resultBloc,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: WAppBar(
            height: 76,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: dark.withOpacity(.08),
              ),
              BoxShadow(
                offset: const Offset(0, -1),
                color: dark.withOpacity(.08),
              ),
            ],
            hasBackButton: false,
            extraActions: [
              WTextField(
                fillColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteSmoke2ToNightRider,
                focusColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteSmoke2ToNightRider,
                enabledBorderColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteSmoke2ToNightRider,
                onChanged: (value) {
                  setState(() {});
                },
                height: 44,
                margin: const EdgeInsets.only(top: 15),
                width: 300,
                borderRadius: 12,
                controller: widget.controller,
                hasSearch: true,
                hintText: LocaleKeys.model_brand.tr(),
                hasClearButton: true,
              ),
              const Spacer(),
              WButton(
                // edit
                onTap: () => sortModalBottomSheet(context, 0, 1),
                width: 44,
                height: 44,
                borderRadius: 12,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteSmoke2ToNightRider,
                child: SvgPicture.asset(AppIcons.filter),
              ),
              const SizedBox(
                width: 12,
              )
            ],
          ),
          // body: BlocBuilder<SearchResultBloc, SearchResultState>(
          //     builder: (context, state) {
          //   print('state list length => ${state.status}');
          //   return Paginator(
          //     hasMoreToFetch: state.count > state.list.length,
          //     itemBuilder: (context, index) =>
          //         CommercialItem(entity: state.list[index]),
          //     fetchMoreFunction: () {
          //       resultBloc.add(SearchResultEvent.getMoreResults());
          //     },
          //     paginatorStatus: FormzStatus.pure,
          //     itemCount: state.list.length,
          //     errorWidget: const SizedBox(),
          //   );
          // }),
        ),
      );
}
