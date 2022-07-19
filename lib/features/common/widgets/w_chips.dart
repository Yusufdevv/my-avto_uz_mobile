import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class WChips extends StatefulWidget {
  final String title;
  const WChips({required this.title, Key? key}) : super(key: key);

  @override
  State<WChips> createState() => _WChipsState();
}

class _WChipsState extends State<WChips> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => WButton(
    onTap: (){
      setState((){
        isSelected = !isSelected;
      });
    },
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

        ],
      ),
      ),
  );
}
