import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class TransmissionScreen extends StatefulWidget {
  final VoidCallback onTap;
  const TransmissionScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<TransmissionScreen> createState() => _TransmissionScreenState();
}

class _TransmissionScreenState extends State<TransmissionScreen> {
  final List<String> titleList = [
    'Передний',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BaseWidget(
        onTap: widget.onTap,
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => RadioItem(
              onTap: (value) {
                setState(() {
                  selectedIndex = index;
                });
              },
              title: titleList[index],
              groupValue: index,
              value: selectedIndex),
          itemCount: titleList.length,
        ),
      ));
}
