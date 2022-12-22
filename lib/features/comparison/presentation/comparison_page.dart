import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_generation.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison.dart';
import 'package:auto/features/comparison/presentation/widgets/empty_widget.dart';
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
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
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
              print('Bu token  ${StorageRepository.getString('token')}');
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
                                  Navigator.of(context).push(
                                    fade(
                                      page: ChooseGenerationComparison(
                                        onTap: () {},
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
                  cars: state.cars,
                  isSticky: state.isSticky,
                );
              }
            },
          ),
        ),
      );
}
