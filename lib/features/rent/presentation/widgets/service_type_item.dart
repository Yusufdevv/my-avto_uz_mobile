import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceTypeItem extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelect;

  const ServiceTypeItem(
      {required this.icon,
      required this.title,
      required this.onTap,
      required this.isSelect,
      Key? key})
      : super(key: key);

  @override
  State<ServiceTypeItem> createState() => _ServiceTypeItemState();
}

class _ServiceTypeItemState extends State<ServiceTypeItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(
            left: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: widget.isSelect ? orange : dividerColor,
            ),
            color: widget.isSelect
                ? Theme.of(context).extension<ThemedColors>()!.snow1ToCocoaBrown
                : Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.icon,
                color: widget.isSelect ? orange : grey,
              ),
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: widget.isSelect
                    ? Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: orange)
                    : Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      );
}
