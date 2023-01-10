import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/presentation/pages/ads/ads_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison.dart';
import 'package:auto/features/comparison/presentation/widgets/empty_comparison_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({Key? key}) : super(key: key);

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  late ComparisonBloc bloc;
  @override
  void initState() {
    bloc = ComparisonBloc(
        comparisonCarsUseCase: ComparisonCarsUseCase(
            comparisonCarsRepo: serviceLocator<ComparisonCarsRepoImpl>()))
      ..add(GetComparableCars());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => bloc,
          ),
        ],
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.car_comparison.tr(),
            titleStyle: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          body: BlocBuilder<ComparisonBloc, ComparisonState>(
            builder: (context, state) {
              if (state.cars.isEmpty) {
                return EmptyComparison(
                  onTap: () {
                    Navigator.push(
                      context,
                      fade(
                        page: ChooseCarBrandComparison(
                          onTap: () => Navigator.of(context).push(
                            fade(
                              page: ChooseCarModelComparison(
                                onTap: () {
                                  print(
                                      '===> ==> comparsin make ${context.read<GetMakesBloc>().state.selectId}');
                                  context.read<AnnouncementListBloc>().add(
                                        AnnouncementListEvent.getFilter(
                                          context
                                              .read<AnnouncementListBloc>()
                                              .state
                                              .filter
                                              .copyWith(
                                                make: context
                                                    .read<GetMakesBloc>()
                                                    .state
                                                    .selectId,
                                                model: context
                                                    .read<GetCarModelBloc>()
                                                    .state
                                                    .selectedId,
                                              ),
                                        ),
                                      );
                                  Navigator.of(context).push(
                                    fade(
                                      page: AdsScreen(
                                        onBack: () {
                                          bloc.add(GetComparableCars());
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Comparison(
                  isSticky: state.isSticky,
                  comparisonBloc: bloc,
                );
              }
            },
          ),
        ),
      );
}
