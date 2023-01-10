import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:flutter/material.dart';

class DriveTypeScreen extends StatefulWidget {
  const DriveTypeScreen({Key? key}) : super(key: key);

  @override
  State<DriveTypeScreen> createState() => _DriveTypeScreenState();
}

class _DriveTypeScreenState extends State<DriveTypeScreen> {
  final List<String> titleList = [
    'Передний',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BaseWidget(
        hasButton: false,
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
