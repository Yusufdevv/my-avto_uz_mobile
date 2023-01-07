import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/ads/ads.dart';
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
  late CarTypeSelectorBloc carTypeSelectorBloc;
  late GetCarModelBloc carModelBloc;
  late GetMakesBloc getMakesBloc;
  late ComparisonBloc bloc;

  @override
  void initState() {
    bloc = ComparisonBloc(
        comparisonCarsUseCase: ComparisonCarsUseCase(
            comparisonCarsRepo: serviceLocator<ComparisonCarsRepoImpl>()))
      ..add(GetComparableCars());
    carTypeSelectorBloc = CarTypeSelectorBloc();
    carModelBloc = GetCarModelBloc(
        useCase:
            GetCarModelUseCase(repository: serviceLocator<AdRepositoryImpl>()));
    getMakesBloc = GetMakesBloc(
      selectedMakeId: -1,
      useCase: GetMakesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetMakesBlocEvent.getMakes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => bloc,
          ),
          BlocProvider(
            create: (context) => carModelBloc,
          ),
          BlocProvider(
            create: (context) => getMakesBloc,
          ),
          BlocProvider(
            create: (context) => carTypeSelectorBloc,
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
                                  // Navigator.of(context).push(
                                  //   fade(
                                  //     page: ChooseGenerationComparison(
                                  //       onTap: () {},
                                  //       modelBloc: modelBloc,
                                  //     ),
                                  //   ),
                                  // );
                                  Navigator.of(context).push(
                                    fade(
                                      page: AdsScreen(
                                        getMakesBloc: getMakesBloc,
                                        getCarModelBloc: carModelBloc,
                                        carTypeSelectorBloc:
                                            carTypeSelectorBloc,
                                      ),
                                    ),
                                  );
                                },
                                bloc: carModelBloc,
                                carTypeSelectorBloc: carTypeSelectorBloc,
                                getMakesBloc: getMakesBloc,
                              ),
                            ),
                          ),
                          bloc: getMakesBloc,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Comparison(
                  isSticky: state.isSticky,
                  carModelBloc: carModelBloc,
                  carTypeSelectorBloc: carTypeSelectorBloc,
                  getMakesBloc: getMakesBloc,
                  comparisonBloc: bloc,
                );
              }
            },
          ),
        ),
      );
}
