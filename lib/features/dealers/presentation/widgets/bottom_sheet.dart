import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/domain/entities/bottom_sheet_variants_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetContent extends StatefulWidget {
  final String markOrRegion;

  const BottomSheetContent({required this.markOrRegion, Key? key})
      : super(key: key);

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int currentValue = 0;
  List<BottomSheetVariantsEntity> marks = [
    BottomSheetVariantsEntity(title: 'BMW', imageUrl: AppIcons.facebook, id: 1),
    BottomSheetVariantsEntity(
        imageUrl: AppIcons.facebook, title: 'Acura', id: 2),
    // BottomSheetVariantsModel(
    //     imageUrl: AppIcons.facebook, title: 'Sacura', id: 3),
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
                  style: Theme.of(context).textTheme.displayLarge,
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: SvgPicture.asset(AppIcons.close),
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
            padding: const EdgeInsets.all(16),
            child: Text(
              LocaleKeys.all_marks.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
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
                  Navigator.pop(context);
                },
                child: Container(
                  color: currentValue == marks[index].id
                      ? Theme.of(context).extension<ThemedColors>()!.snowToBlack
                      : Colors.transparent,
                  padding: const EdgeInsets.only(left: 16, top: 9),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9, right: 16),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 32,
                              width: 32,
                              child: SvgPicture.asset(marks[index].imageUrl),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Text(
                              marks[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 16),
                            )),
                            if (currentValue != marks[index].id) ...{
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
              ),
            ),
          ),
        ],
      );
}
