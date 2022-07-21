import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class WChips extends StatefulWidget {
  final String title;
  const WChips({required this.title, Key? key}) : super(key: key);

  @override
  State<WChips> createState() => _WChipsState();
}

class _WChipsState extends State<WChips> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap: () => setState(() => isChecked = !isChecked),
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            width: 1,
            color: purple,
          ),
          color: purple.withOpacity(0.1),
        ),
      child: Row(
        children: [
      GestureDetector(onTap:() => setState(() => isChecked = !isChecked), child: WCheckBox(isChecked: isChecked, checkBoxColor: purple)),
          const SizedBox(width: 4,),
          Text(widget.title, style: Theme.of(context).textTheme.subtitle1,)
        ],
      ),
      ),
  );
}
