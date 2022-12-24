import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class ColorsItem extends StatefulWidget {
  final Color color;
  final String colorName;
  final String id;
  final Function(String) onTap;
  final bool isSelected;

  const ColorsItem({required this.color, this.isSelected = false, required this.onTap, required this.id, required this.colorName, Key? key}) : super(key: key);

  @override
  State<ColorsItem> createState() => _ColorsItemState();
}

class _ColorsItemState extends State<ColorsItem> {

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap: () {
      widget.onTap(widget.id);
    },
    child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: widget.isSelected ? purple : Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
          ),
          color:widget.isSelected ? Theme.of(context).extension<ThemedColors>()!.lavenderToMediumSlateBlue30 : Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color,
                border: Border.all(
                  width: 1,
                  color: widget.colorName == 'Черный' ? Theme.of(context).extension<ThemedColors>()!.solitudeToBastille :dividerColor
                )
              ),
              width: double.infinity,
              height: 54,
            ),
            const SizedBox(height: 12,),
            Text(widget.colorName, style: widget.isSelected ? Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600, fontSize: 14) : Theme.of(context).textTheme.subtitle1!.copyWith(color: grey),)
          ],
        ),
      ),
  );
}
