import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/presentation/bloc/commercial_bloc/commercial_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RentCommercialScreen extends StatefulWidget {
  const RentCommercialScreen({Key? key}) : super(key: key);

  @override
  State<RentCommercialScreen> createState() => _RentCommercialScreenState();
}

class _RentCommercialScreenState extends State<RentCommercialScreen> {
  final List<String> titles = [
    LocaleKeys.conditioner.tr(),
    LocaleKeys.baby_chair.tr(),
    LocaleKeys.full_tank.tr(),
    LocaleKeys.automatic_box.tr(),
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
        physics: const BouncingScrollPhysics(),
        children: [
          BlocBuilder<CommercialBloc, CommercialState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * .8,
                    child: const Center(child: CupertinoActivityIndicator()));
              } else if (state.status.isSubmissionSuccess) {
                if (state.list.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Paginator(
                            hasMoreToFetch: state.count > state.list.length,
                            itemBuilder: (context, index) => CategoryTypeItem(
                              onAllTap: () => Navigator.push(
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
                          ),
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
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .2),
                    child: const NoDataWidget(),
                  );
                }
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
