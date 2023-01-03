import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/widgets/characteristic_box.dart';
import 'package:flutter/material.dart';

class CharacteristicTable extends StatefulWidget {
  final String title;
  final List<String> list;
  final List<String> titleList;

  const CharacteristicTable(
      {required this.titleList,
      required this.list,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<CharacteristicTable> createState() => _CharacteristicTableState();
}

class _CharacteristicTableState extends State<CharacteristicTable> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 16),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        widget.list.sublist(0, 3).length,
                        (index) => CharacteristicBox(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitudeToNero,
                          title: widget.titleList.sublist(0, 3)[index],
                          value: widget.list.sublist(0, 3)[index],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        widget.list.sublist(3, 6).length,
                        (index) => CharacteristicBox(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToNero1,
                          title: widget.titleList.sublist(3, 6)[index],
                          value: widget.list.sublist(3, 6)[index],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        widget.list.sublist(6, 6).length,
                        (index) => CharacteristicBox(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitudeToNero,
                          title: widget.titleList.sublist(6, 9)[index],
                          value: widget.list.sublist(6, 9)[index],
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     ...List.generate(
                  //       widget.list.sublist(9, 12).length,
                  //       (index) => CharacteristicBox(
                  //         color: Theme.of(context)
                  //             .extension<ThemedColors>()!
                  //             .whiteToNero1,
                  //         title: widget.titleList.sublist(9, 12)[index],
                  //         value: widget.list.sublist(9, 12)[index],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
}
