import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class GearboxScreen extends StatefulWidget {
  final VoidCallback onTap;

  const GearboxScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<GearboxScreen> createState() => _GearboxScreenState();
}

class _GearboxScreenState extends State<GearboxScreen> {
  int selectedIndex = 0;
  final List<String> titleList = ['Бензиновый'];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BaseWidget(
        onTap: widget.onTap,
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => RadioItem(
              hasImage: true,
              image: AppIcons.engine,
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
