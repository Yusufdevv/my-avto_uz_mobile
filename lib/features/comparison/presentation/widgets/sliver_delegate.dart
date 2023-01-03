import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/bloc/delete_comparison/delete_comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_sticky.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:flutter/material.dart';

class SliverWidget extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  final VoidCallback onAddCar;
  final ValueChanged<bool> setSticky;
  final DeleteComparisonBloc deleteComparisonBloc;
  final ComparisonBloc comparisonBloc;

  SliverWidget({
    required this.onAddCar,
    required this.numberOfAddedCars,
    required this.boolean,
    required this.onChanged,
    required this.scrollController,
    required this.setSticky,
    required this.deleteComparisonBloc,
    required this.comparisonBloc,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset >= 220) {
      setSticky(true);
    } else {
      setSticky(false);
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 50),
      child: shrinkOffset >= 220
          ? Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              child: ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    comparisonBloc.state.cars.length,
                    (index) => StickyAdderCar(
                      carImage:
                          comparisonBloc.state.cars[index].announcement.mainData.gallery.isEmpty
                              ? ''
                              : comparisonBloc.state.cars[index].announcement.mainData.gallery[0],
                      carSalary:
                          '${comparisonBloc.state.cars[index].announcement.price} ${comparisonBloc.state.cars[index].announcement.currency}',
                      name: comparisonBloc.state.cars[index].announcement.mainData.make,
                    ),
                  )),
            )
          : Container(
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
                                carName:
                                    comparisonBloc.state.cars[index].announcement.mainData.model,
                                carSalary:
                                    '${comparisonBloc.state.cars[index].announcement.price} ${comparisonBloc.state.cars[index].announcement.currency.toUpperCase()}',
                                imageUrl:
                                    comparisonBloc.state.cars[index].announcement.mainData.gallery,
                                onTabCall: () {
                                  bottomSheetForCalling(
                                    context,
                                    comparisonBloc.state.cars[index]
                                        .announcement
                                        .mainData
                                        .user
                                        .phoneNumber,
                                  );
                                },
                                onTabClose: () {
                                  deleteComparisonBloc.add(
                                    DeleteComparisonEvent.deleteComparison(
                                      comparisonBloc.state.cars[index].order,
                                    ),
                                  );
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
