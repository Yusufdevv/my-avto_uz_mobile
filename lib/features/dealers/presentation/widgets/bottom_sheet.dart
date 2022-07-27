import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/constants/icons.dart';
import '../../domain/entities/models/bottom_sheet_variants.dart';

class BottomSheetContent extends StatefulWidget {
  String markOrRegion;
  BottomSheetContent({required this.markOrRegion, Key? key}) : super(key: key);

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int currentValue = 0;
  List<BottomSheetVariantsModel> marks = [
    BottomSheetVariantsModel(
        title: 'BMW', picture: SvgPicture.asset(AppIcons.facebook), id: 1),
    BottomSheetVariantsModel(
        picture: SvgPicture.asset(AppIcons.facebook), title: 'Acura', id: 2),
  ];
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  widget.markOrRegion,
                  style: Theme.of(context).textTheme.headline1,
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppIcons.close,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitude2ToNightRider,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Все марки',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitude2ToNightRider,
          ),
          Column(
            children: List.generate(
                marks.length,
                (index) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => currentValue = marks[index].id);
                      },
                      child: Container(
                        color: currentValue == marks[index].id
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .snowToBlack
                            : Colors.transparent,
                        padding: const EdgeInsets.only(left: 16, top: 9),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 9, right: 16),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: marks[index].picture,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      child: Text(
                                    marks[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(fontSize: 16),
                                  )),
                                  if (currentValue == marks[index].id) ...{
                                    SvgPicture.asset(AppIcons.ticked)
                                  } else ...{
                                    const SizedBox()
                                  }
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .solitude2ToNightRider,
                            ),
                          ],
                        ),
                      ),
                    )),
          )
        ],
      );
}
