import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_sticky.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComparisonSliverDelegete extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  final VoidCallback onAddCar;
  final ValueChanged<bool> setSticky;
  final ComparisonBloc comparisonBloc;
  final GlobalKey<AnimatedListState> listkey;

  ComparisonSliverDelegete({
    required this.onAddCar,
    required this.numberOfAddedCars,
    required this.boolean,
    required this.onChanged,
    required this.scrollController,
    required this.setSticky,
    required this.comparisonBloc,
    required this.listkey,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset >= 220) {
      setSticky(true);
    } else {
      setSticky(false);
    }
    return BlocBuilder<ComparisonBloc, ComparisonState>(
      builder: (context, state) => Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: shrinkOffset >= 180
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToNero,
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
                        state.cars.length,
                        (index) => StickyAdderCar(
                          carImage: state.cars[index].announcement.mainData
                                  .gallery.isEmpty
                              ? ''
                              : state
                                  .cars[index].announcement.mainData.gallery[0],
                          carSalary:
                              '${MyFunctions.getFormatCost(state.cars[index].announcement.price)} ${state.cars[index].announcement.currency.toUpperCase()}',
                          name: '${state.cars[index].announcement.mainData.make} ${state.cars[index].announcement.mainData.model} ${state.cars[index].announcement.mainData.generation}',
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
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowIndicator();
                                return true;
                              },
                              child: AnimatedList(
                                key: listkey,
                                padding:
                                    const EdgeInsets.only(right: 16, left: 8),
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                initialItemCount: state.cars.length + 1,
                                itemBuilder: (context, index, animation) {
                                  final item = state.cars.length == index
                                      ? null
                                      : state.cars[index];
                                  if (state.cars.length == index) {
                                    return AddNewCar(
                                      onTap: onAddCar,
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(fade(
                                                page: CarSingleScreen(
                                                    id: item!
                                                        .announcement.id)));
                                      },
                                      behavior: HitTestBehavior.opaque,
                                      child: AddedCar(
                                          ownerType:
                                              item!.announcement.ownership,
                                          hasCallCard: true,
                                          carName:
                                              '${item.announcement.mainData.make} ${item.announcement.mainData.model} ${item.announcement.mainData.generation}',
                                          carSalary:
                                              '${MyFunctions.getFormatCost(item.announcement.price)} ${item.announcement.currency.toUpperCase()}',
                                          imageUrl: item
                                              .announcement.mainData.gallery,
                                          onTabCall: () {
                                            bottomSheetForCalling(
                                              context,
                                              item.announcement.mainData.user
                                                  .phoneNumber,
                                            );
                                          },
                                          onTabClose: () {
                                            comparisonBloc
                                                .add(GetCars(id: item.id));
                                            listkey.currentState?.removeItem(
                                              index,
                                              (context, animation) => AddedCar(
                                                ownerType:
                                                    item.announcement.ownership,
                                                hasCallCard: true,
                                                carName: item.announcement
                                                    .mainData.model,
                                                carSalary:
                                                    '${MyFunctions.getFormatCost(item.announcement.price)} ${item.announcement.currency.toUpperCase()}',
                                                imageUrl: item.announcement
                                                    .mainData.gallery,
                                                onTabCall: () {},
                                                onTabClose: () {},
                                                id: item.id,
                                                animation: animation,
                                              ),
                                            );
                                            context
                                                .read<ComparisonAddBloc>()
                                                .add(ComparisonAddEvent
                                                    .deleteComparison(
                                                        item.order));
                                            context
                                                .read<ComparisonAddBloc>()
                                                .add(ComparisonAddEvent
                                                    .addToMapComparison(
                                                        id: item
                                                            .announcement.id,
                                                        value: false));
                                          },
                                          id: item.id,
                                          animation: animation),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
