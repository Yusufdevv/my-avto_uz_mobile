import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison.dart';
import 'package:auto/features/comparison/presentation/widgets/empty_comparison_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
  Widget build(BuildContext context) => 
      BlocProvider(
        create: (context) => bloc,
    child: Scaffold(
      appBar: WAppBar(
        boxShadow: const [],
        title: LocaleKeys.car_comparison.tr(),
        titleStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        onTapBack: () {
          context
              .read<GetCarModelBloc>()
              .add(GetCarModelEvent.selectedModelItem(id: -1, name: '',model:const MakeEntity()));
          context.read<GetMakesBloc>().add(
              GetMakesBlocEvent.selectedCarItems(
                  id: -1, name: '', imageUrl: '', makeEntity:const MakeEntity()));
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<ComparisonBloc, ComparisonState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status == FormzStatus.submissionSuccess ||
              state.status == FormzStatus.submissionFailure) {
            if (state.cars.isEmpty) {
              return EmptyComparison(
                onTap: () {},
              );
            } else {
              return Comparison(
                isSticky: state.isSticky,
                comparisonBloc: bloc,
              );
            }
          }
          return Center(
            child: Text(LocaleKeys.error.tr()),
          );
        },
      ),
    ),
  );
}
