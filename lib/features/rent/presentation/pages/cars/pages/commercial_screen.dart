import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/presentation/bloc/commercial_bloc/commercial_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({Key? key}) : super(key: key);

  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen> {
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
  final List<bool> isSelected = [
    false,
    false,
    false,
    false,
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
                          isSelect: isSelected[index],
                          icon: icons[index],
                          title: titles[index],
                          onTap: () {},
                        ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CommercialBloc, CommercialState>(
            builder: (context, state) {
              print('===== ${state.status.name}  =====');
              // print("===== ${state.list.rentList.lenth}  =====");
              print('===== ${state.status.isSubmissionSuccess}  =====');
              if (state.status.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status.isSubmissionSuccess) {
                for (int i = 0; i < state.list.length; i++) {
                  print('=====  ${state.list[i].name} =====');
                   print("=====  ${state.list[i]} =====");
                
                  for (int n = 0; n < state.list[i].rentList.length; n++) {
                    print('=====  ${state.list[i].rentList[n].minAge}');
                    print(
                        '=====  ${state.list[i].rentList[n].rentCar.gallery}');
                    for (int m = 0;
                        m < state.list[i].rentList[n].rentCar.gallery.length;
                        m++) {
                      print(" =====  ${state.list[i].rentList[n].rentCar.gallery[m]}  ===== ");
                    }
                  }
                }
                print('paginator returning');
                return Paginator(
                  hasMoreToFetch: state.count > state.list.length,
                  itemBuilder: (context, index) => CategoryTypeItem(
                    onTap: () => Navigator.push(
                        context,
                        fade(
                            page: SingleCategoryScreen(
                          id: state.list[index].id,
                          categoryName: state.list[index].name,
                        ))),
                    rentMainEntity: state.list[index],
                  ),
                  itemCount: state.list.length,
                  paginatorStatus: FormzStatus.submissionSuccess,
                  errorWidget: const SizedBox(),
                  fetchMoreFunction: () {
                    context
                        .read<CommercialBloc>()
                        .add(CommercialEvent.getMoreResults());
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
          // const SizedBox(
          //   height: 16,
          // ),
          // CategoryTypeItem(
          //   onTap: () => Navigator.push(
          //       context,
          //       fade(
          //           page: const SingleCategoryScreen(
          //         rentMainEntity: RentMainEntity(),
          //       ))),
          //   rentMainEntity: const RentMainEntity(),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          // CategoryTypeItem(
          //   onTap: () => Navigator.push(
          //       context,
          //       fade(
          //           page: const SingleCategoryScreen(
          //         rentMainEntity: RentMainEntity(),
          //       ))),
          //   rentMainEntity: const RentMainEntity(),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          // CategoryTypeItem(
          //   onTap: () => Navigator.push(
          //       context,
          //       fade(
          //           page: const SingleCategoryScreen(
          //         rentMainEntity: RentMainEntity(),
          //       ))),
          //   rentMainEntity: const RentMainEntity(),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
        ],
      );
}
