import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class WSerachBar extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;
  final Function() onChanged;
  WSerachBar({required this.controller, required this.onChanged});
  @override
  double get minExtent => 64;

  @override
  double get maxExtent => 64;

  @override
  bool shouldRebuild(WSerachBar oldDelegate) => controller != oldDelegate.controller;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: WTextField(
          fillColor: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteLilacToPayneGrey,
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
          hintText: 'Поиск',
          height: 40,
          controller: controller,
          hasClearButton: true,
        ),
      );
}
