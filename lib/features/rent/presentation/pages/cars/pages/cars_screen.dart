import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
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
        child: BlocBuilder<RentBloc, RentState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status.isSubmissionSuccess) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 46,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: state.searchParams.entries
                            .map(
                              (param) => ServiceTypeItem(
                                isSelect: param.value.isSelected,
                                icon: param.value.icon,
                                title: param.value.title,
                                onTap: () => context.read<RentBloc>().add(
                                    RentChangeSearchParamEvent(
                                        paramKey: param.key,
                                        value: true,
                                        isRefresh: true)),
                              ),
                            )
                            .toList(),
                      )),
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
                            title: 'Кондиционер',
                            onTap: () {
                              if (state.hasAirConditioners == 0) {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        id: widget.id,
                                        hasAirConditioner: 1,
                                        isRefresh: false,
                                      ),
                                    );
                              } else {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        id: widget.id,
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
                            title: 'Детское кресло',
                            onTap: () {
                              if (state.hasBabySeat == 0) {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        id: widget.id,
                                        hasBabySeat: 1,
                                        isRefresh: false,
                                      ),
                                    );
                              } else {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                          id: widget.id,
                                          hasBabySeat: 0,
                                          isRefresh: false),
                                    );
                              }
                            },
                          ),
                          ServiceTypeItem(
                            isSelect: state.rentCarIsFullFuel != 0,
                            icon: AppIcons.gas,
                            title: 'Полный бак',
                            onTap: () {
                              if (state.rentCarIsFullFuel == 0) {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        isRefresh: false,
                                        id: widget.id,
                                        rentCarIsFullFuel: 1,
                                      ),
                                    );
                              } else {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        isRefresh: false,
                                        id: widget.id,
                                        rentCarIsFullFuel: 0,
                                      ),
                                    );
                              }
                            },
                          ),
                          ServiceTypeItem(
                            isSelect: state.rentCarIsClean != 0,
                            icon: AppIcons.carWash,
                            title: 'Чистая машина',
                            onTap: () {
                              if (state.rentCarIsClean == 0) {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        isRefresh: false,
                                        id: widget.id,
                                        rentCarIsClean: 1,
                                      ),
                                    );
                              } else {
                                context.read<RentBloc>().add(
                                      RentSetIdEvent(
                                        isRefresh: false,
                                        id: widget.id,
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
                  Paginator(
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
                  const SizedBox(height: 10),
                ],
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
      );
}
