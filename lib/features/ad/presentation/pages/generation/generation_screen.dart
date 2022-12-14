import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class GenerationScreen extends StatefulWidget {
  final VoidCallback onTap;

  const GenerationScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  final List<String> titleList = [
    'I (G07)',
    'M5',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BaseWidget(
        onTap: selectedIndex < 0 ? () {} : widget.onTap,
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
          itemCount: 2,
        ),
      ));
}
