import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/presentation/widgets/add_new_car.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_sticky.dart';
import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverWidget extends SliverPersistentHeaderDelegate {
  final ScrollController scrollController;
  final int numberOfAddedCars;
  final bool boolean;
  final ValueChanged<bool> onChanged;
  SliverWidget({
    required this.numberOfAddedCars,
    required this.boolean,
    required this.onChanged,
    required this.scrollController,
  });
  List<Row> items(BuildContext context) {
    var itemsss = <Row>[];
    for (var i = 0; i < numberOfAddedCars; i++) {
      itemsss.add(Row(
        key: Key('$i'),
        children: const [
          AddedCar(),
        ],
      ));
    }
    return itemsss;
  }

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: shrinkOffset >= 246
            ? Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    StickyAdderCar(),
                    StickyAdderCar(),
                  ],
                ))
            : Container(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToBlack,
                padding: const EdgeInsets.only(top: 16, left: 8),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 6),
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 234,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            ListOfAddedCars(
                              list: items(context),
                            ),
                            const AddNewCar()
                          ]),
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Показать только отличия',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: greyText,
                              ),
                            ),
                          ),
                          CupertinoSwitch(
                            value: boolean,
                            onChanged: onChanged,
                            activeColor: green,
                            thumbColor: white,
                            trackColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteLilacToPayneGrey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => 315;

  @override
  // TODO: implement minExtent
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class ListOfAddedCars extends StatefulWidget {
  // final ScrollController scrollController;
  final List list;
  const ListOfAddedCars({Key? key, required this.list}) : super(key: key);

  @override
  State<ListOfAddedCars> createState() => _ListOfAddedCarsState();
}

class _ListOfAddedCarsState extends State<ListOfAddedCars> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: ReorderableListView(
          scrollDirection: Axis.horizontal,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Row item = widget.list.removeAt(oldIndex);
              widget.list.insert(newIndex, item);
            });
          },
          children: [
            ...List.generate(2, (index) => widget.list[index]),
          ],
        ),
      );
}
