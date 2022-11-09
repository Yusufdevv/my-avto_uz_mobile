import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/part/sort_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortBottomSheet extends StatefulWidget {
  final double? height;
  final bool hasBackbutton;
  final Widget? leading;
  final String title;
  final List<Widget> actions;
  final List<Widget> children;
  final double verticalPadding;
  final double horizontalPadding;
  final bool hasDivider;
  final EdgeInsets actionsPadding;
  final EdgeInsets leadingPadding;
  final bool centerTitle;
  const SortBottomSheet(
      {required this.title,
      required this.children,
      this.height,
      this.leading,
      this.actions = const [],
      this.hasBackbutton = false,
      this.hasDivider = true,
      this.verticalPadding = 20,
      this.horizontalPadding = 16,
      this.actionsPadding = const EdgeInsets.symmetric(horizontal: 16),
      this.leadingPadding = const EdgeInsets.symmetric(horizontal: 16),
      this.centerTitle = false,
      super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  @override
  Widget build(BuildContext context) => Container(
        height: widget.height ?? MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        padding: EdgeInsets.only(
          top: widget.verticalPadding,
          left: widget.horizontalPadding,
          bottom: widget.verticalPadding,
        ),
        child: Column(
          children: [
            Row(
              children: [
                widget.leading ??
                    (widget.hasBackbutton
                        ? WButton(
                            padding: widget.leadingPadding,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            color: transparentButton,
                            child: SvgPicture.asset(
                              AppIcons.chevronLeft,
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox()),
                const SizedBox(width: 4),
                if (widget.centerTitle) const Spacer() else const SizedBox(),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                if (widget.actions.isEmpty)
                  WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    padding: widget.actionsPadding,
                    color: transparentButton,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  ...widget.actions,
              ],
            ),
            if (widget.hasDivider) const Divider() else const SizedBox(),
            Column(
              children: widget.children,
            ),
          ],
        ),
      );
}
