import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ComparisonSearchBar extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;
  final Function() onChanged;
  final VoidCallback? onClear;
  ComparisonSearchBar(
      {required this.controller, required this.onChanged, this.onClear});
  @override
  double get minExtent => 64;

  @override
  double get maxExtent => 64;

  @override
  bool shouldRebuild(ComparisonSearchBar oldDelegate) =>
      controller != oldDelegate.controller;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: WTextField(
          fillColor: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteSmoke2ToNightRider,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          focusColor: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteSmoke2ToNightRider,
          enabledBorderColor: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteSmoke2ToNightRider,
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          onChanged: (value) {
            onChanged();
          },
          borderRadius: 12,
          hasSearch: true,
          borderColor: purple,
          keyBoardType: TextInputType.name,
          textInputAction: TextInputAction.search,
          hintText: LocaleKeys.search.tr(),
          height: 40,
          controller: controller,
          hasClearButton: true,
          onClear: onClear,
        ),
      );
}
