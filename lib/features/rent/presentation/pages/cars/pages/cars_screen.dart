import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CarsScreen extends StatefulWidget {
  final int id;

  const CarsScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<RentBloc, RentState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: const Center(child: CupertinoActivityIndicator()));
            } else if (state.status.isSubmissionSuccess) {
              if (state.list.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 46,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ServiceTypeItem(
                              isSelect: state.hasAirConditioners != 0,
                              icon: AppIcons.wind,
                              title: LocaleKeys.conditioner.tr(),
                              onTap: () {
                                if (state.hasAirConditioners == 0) {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          categoryId: widget.id,
                                          hasAirConditioner: 1,
                                          isRefresh: false,
                                        ),
                                      );
                                } else {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          categoryId: widget.id,
                                          hasAirConditioner: 0,
                                          isRefresh: false,
                                        ),
                                      );
                                }
                              },
                            ),
                            ServiceTypeItem(
                              isSelect: state.hasBabySeat != 0,
                              icon: AppIcons.child,
                              title: LocaleKeys.baby_chair.tr(),
                              onTap: () {
                                if (state.hasBabySeat == 0) {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          categoryId: widget.id,
                                          hasBabySeat: 1,
                                          isRefresh: false,
                                        ),
                                      );
                                } else {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                            categoryId: widget.id,
                                            hasBabySeat: 0,
                                            isRefresh: false),
                                      );
                                }
                              },
                            ),
                            ServiceTypeItem(
                              isSelect: state.rentCarIsFullFuel != 0,
                              icon: AppIcons.gas,
                              title: LocaleKeys.full_tank.tr(),
                              onTap: () {
                                if (state.rentCarIsFullFuel == 0) {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          isRefresh: false,
                                          categoryId: widget.id,
                                          rentCarIsFullFuel: 1,
                                        ),
                                      );
                                } else {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          isRefresh: false,
                                          categoryId: widget.id,
                                          rentCarIsFullFuel: 0,
                                        ),
                                      );
                                }
                              },
                            ),
                            ServiceTypeItem(
                              isSelect: state.rentCarIsClean != 0,
                              icon: AppIcons.carWash,
                              title: LocaleKeys.clean_car.tr(),
                              onTap: () {
                                if (state.rentCarIsClean == 0) {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          isRefresh: false,
                                          categoryId: widget.id,
                                          rentCarIsClean: 1,
                                        ),
                                      );
                                } else {
                                  context.read<RentBloc>().add(
                                        RentSetIdEvent(
                                          isRefresh: false,
                                          categoryId: widget.id,
                                          rentCarIsClean: 0,
                                        ),
                                      );
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
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
                              ),
                            ),
                          ),
                          rentMainEntity: state.list[index],
                        ),
                        itemCount: state.list.length,
                        paginatorStatus: FormzStatus.submissionSuccess,
                        errorWidget: const SizedBox(),
                        fetchMoreFunction: () {
                          context
                              .read<RentBloc>()
                              .add(RentGetMoreEvent(isRefresh: true));
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
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
      );
}
