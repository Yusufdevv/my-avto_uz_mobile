import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ComparisonSliverDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onAddCar;
  final ComparisonBloc comparisonBloc;
  final ScrollController scrollController;
  ComparisonSliverDelegate(
      {required this.onAddCar,
      required this.comparisonBloc,
      required this.scrollController});

  final Duration _duration = const Duration(milliseconds: 80);

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Stack(
        children: [
          AnimatedOpacity(
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
                                hasCallCard: true,
                                carName: comparisonBloc.state.cars[index]
                                    .announcement.mainData.model,
                                carSalary:
                                    '${comparisonBloc.state.cars[index].announcement.price} ${comparisonBloc.state.cars[index].announcement.currency.toUpperCase()}',
                                imageUrl: comparisonBloc.state.cars[index]
                                    .announcement.mainData.gallery,
                                onTabCall: () {
                                  bottomSheetForCalling(
                                    context,
                                    comparisonBloc.state.cars[index]
                                        .announcement.mainData.user.phoneNumber,
                                  );
                                },
                                onTabClose: () {
                                  BlocProvider.of<ComparisonAddBloc>(context)
                                      .add(ComparisonAddEvent.deleteComparison(
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
                  ],
                ),
              ),
            ),
          ),
          if (shrinkOffset >= 180)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedContainer(
                      decoration: BoxDecoration(
                          borderRadius: shrinkOffset >= 180
                              ? BorderRadius.zero
                              : BorderRadius.circular(12),
                          color: shrinkOffset >= 180
                              ? Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToNero
                              : Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteWithOpacity90ToNero,
                          border: shrinkOffset >= 180
                              ? null
                              : Border.all(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteSmoke2ToNightRider)),
                      padding: shrinkOffset >= 180
                          ? EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top +
                                  MediaQuery.of(context).size.height * 0.02,
                              left: 16,
                              bottom: 16,
                            )
                          : const EdgeInsets.all(12),
                      margin: shrinkOffset >= 180
                          ? EdgeInsets.zero
                          : const EdgeInsets.symmetric(horizontal: 20),
                      duration: _duration,
                      child: Row(
                        children: [
                          AnimatedCrossFade(
                            duration: _duration,
                            firstChild: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(AppIcons.chevronLeft),
                            ),
                            secondChild: const SizedBox(),
                            crossFadeState: shrinkOffset >= 180
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                          SizedBox(width: shrinkOffset >= 180 ? 12 : 0),
                          AnimatedContainer(
                            height: shrinkOffset >= 180 ? 32 : 48,
                            width: shrinkOffset >= 180 ? 32 : 48,
                            duration: _duration,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: dividerColor),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedDefaultTextStyle(
                                  duration: _duration,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontSize:
                                              shrinkOffset >= 180 ? 14 : 16),
                                  child: const Text('ORIENT MOTORS')),
                              AnimatedDefaultTextStyle(
                                duration: _duration,
                                style: TextStyle(
                                    fontSize: shrinkOffset >= 180 ? 12 : 14,
                                    fontWeight: FontWeight.w400,
                                    color: purple),
                                child: Text(
                                  LocaleKeys.autosalon.tr(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => 260;

  @override
  // TODO: implement minExtent
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
