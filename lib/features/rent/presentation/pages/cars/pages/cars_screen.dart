import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  late RentBloc rentBloc;
  final List<String> titles = [
    'Кондиционер',
    'Детское кресло',
    'Полный бак',
    'Автомат коробка'
  ];
  final List<String> icons = [
    AppIcons.wind,
    AppIcons.child,
    AppIcons.gas,
    AppIcons.gearBox,
  ];

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          SizedBox(
            height: 46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                  titles.length,
                  (index) => ServiceTypeItem(
                    icon: icons[index],
                    title: titles[index],
                    onTap: () {
                      setState(() {
                        RentBloc(RentUseCase(), 5)
                            .add(RentEvent.getResults(isRefresh: false));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<RentBloc, RentState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status.isSubmissionSuccess) {
                return Paginator(
                  hasMoreToFetch: state.count > state.list.length,
                  itemBuilder: (context, index) => CategoryTypeItem(
                    onTap: () => Navigator.push(
                      context,
                      fade(
                        page: SingleCategoryScreen(
                          id: state.list[index].id,
                          categoryName: state.list[index].name,
                        ),
                      ),
                    ),
                    rentMainEntity: state.list[index],
                  ),
                  itemCount: state.list.length,
                  paginatorStatus: FormzStatus.submissionSuccess,
                  errorWidget: const SizedBox(),
                  fetchMoreFunction: () {
                    context.read<RentBloc>().add(RentEvent.getMoreResults());
                  },
                );
              } else if (state.status.isSubmissionFailure) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      );
}
