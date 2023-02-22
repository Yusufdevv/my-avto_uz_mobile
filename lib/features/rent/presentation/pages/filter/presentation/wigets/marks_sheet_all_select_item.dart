import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marka_checkbox.dart';
import 'package:flutter/material.dart';

class SheetSelectAllButton extends StatelessWidget {
  final bool isAllChecked;
  final VoidCallback onTap;
  final String title;
  const SheetSelectAllButton({
    required this.title,
    required this.onTap,
    required this.isAllChecked,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: border))),
        child: WScaleAnimation(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              if (isAllChecked) const MarkaChecked()
            ],
          ),
        ),
      );
}
