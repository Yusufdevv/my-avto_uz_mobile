import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/widgets/bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerRegionMark extends StatelessWidget {
  final String markOrRegion;

  const ContainerRegionMark({
    required this.markOrRegion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
              backgroundColor:
                  Theme.of(context).extension<ThemedColors>()!.whiteToNero,
              context: context,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.97,
              ),
              isDismissible: true,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              builder: (context) =>
                  BottomSheetContent(markOrRegion: markOrRegion));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeContainerToNero1,
              border: Border.all(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitude2ToNightRider)),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  markOrRegion == 'Марка'
                      ? LocaleKeys.choose_brand.tr()
                      : LocaleKeys.choose_region.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: grey,
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset(
                  AppIcons.chevronRightBlack,
                  color: greyText,
                ),
              ),
            ],
          ),
        ),
      );
}
