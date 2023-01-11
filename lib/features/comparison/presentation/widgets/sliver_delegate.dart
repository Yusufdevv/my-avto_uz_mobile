import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_sticky.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverWidget extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  final VoidCallback onAddCar;
  final ValueChanged<bool> setSticky;
  final ComparisonBloc comparisonBloc;

  SliverWidget({
    required this.onAddCar,
    required this.numberOfAddedCars,
    required this.boolean,
    required this.onChanged,
    required this.scrollController,
    required this.setSticky,
    required this.comparisonBloc,
  });

  final Duration _duration = const Duration(milliseconds: 80);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset >= 220) {
      setSticky(true);
    } else {
      setSticky(false);
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: shrinkOffset >= 180
          ? Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: dark.withOpacity(0.08),
                  ),
                  BoxShadow(
                    offset: const Offset(0, -1),
                    color: dark.withOpacity(0.08),
                  ),
                ],
              ),
              child: ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    comparisonBloc.state.cars.length,
                    (index) => StickyAdderCar(
                      carImage: comparisonBloc.state.cars[index].announcement
                              .mainData.gallery.isEmpty
                          ? ''
                          : comparisonBloc.state.cars[index].announcement
                              .mainData.gallery[0],
                      carSalary:
                          '${comparisonBloc.state.cars[index].announcement.price} ${comparisonBloc.state.cars[index].announcement.currency}',
                      name: comparisonBloc
                          .state.cars[index].announcement.mainData.make,
                    ),
                  )),
            )
          : AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: shrinkOffset >= 20 && shrinkOffset <= 60
                  ? 0.8
                  : shrinkOffset >= 60 && shrinkOffset <= 80
                      ? 0.6
                      : shrinkOffset >= 80 && shrinkOffset <= 160
                          ? 0.4
                          : shrinkOffset >= 150
                              ? 0.2
                              : 1,
              child: Container(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToBlack,
                padding: const EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 234,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(right: 16, left: 8),
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                comparisonBloc.state.cars.length,
                                (index) => AddedCar(
                                  ownerType: '',
                                  // ownerType: comparisonBloc
                                  //     .state.cars[index].announcement.ownership,
                                  hasCallCard: MyFunctions.enableForCalling(
                                    callFrom: comparisonBloc
                                        .state
                                        .cars[index]
                                        .announcement
                                        .mainData
                                        .contactAvailableFrom,
                                    callTo: comparisonBloc
                                        .state
                                        .cars[index]
                                        .announcement
                                        .mainData
                                        .contactAvailableTo,
                                  ),
                                  carName: comparisonBloc.state.cars[index]
                                      .announcement.mainData.model,
                                  carSalary:
                                      '${comparisonBloc.state.cars[index].announcement.price} ${comparisonBloc.state.cars[index].announcement.currency.toUpperCase()}',
                                  imageUrl: comparisonBloc.state.cars[index]
                                      .announcement.mainData.gallery,
                                  onTabCall: () {
                                    bottomSheetForCalling(
                                      context,
                                      comparisonBloc
                                          .state
                                          .cars[index]
                                          .announcement
                                          .mainData
                                          .user
                                          .phoneNumber,
                                    );
                                  },
                                  onTabClose: () {
                                    BlocProvider.of<ComparisonAddBloc>(context)
                                        .add(
                                            ComparisonAddEvent.deleteComparison(
                                      comparisonBloc.state.cars[index].order,
                                    ));
                                    comparisonBloc.add(GetComparableCars());
                                  },
                                ),
                              ),
                              AddNewCar(
                                onTap: onAddCar,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Text(
                      //           LocaleKeys.show_only_difference.tr(),
                      //           style: const TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w600,
                      //             color: greyText,
                      //           ),
                      //         ),
                      //       ),
                      //       CupertinoSwitch(
                      //         value: boolean,
                      //         onChanged: onChanged,
                      //         activeColor: green,
                      //         thumbColor: white,
                      //         trackColor: Theme.of(context)
                      //             .extension<ThemedColors>()!
                      //             .whiteLilacToPayneGrey,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  double get maxExtent => 270;

  @override
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
