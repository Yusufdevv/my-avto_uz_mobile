import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ModificationScreen extends StatefulWidget {
  const ModificationScreen({Key? key}) : super(key: key);

  @override
  State<ModificationScreen> createState() => _ModificationScreenState();
}

class _ModificationScreenState extends State<ModificationScreen> {
  int selectedIndex = 0;
  final List<String> titleList = [
    'xDrive40i 3.0 Steptronic (340 л.с.)',
    'xDrive50i 4.4 Steptronic (462 л.с.)'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      body: BaseWidget(
          headerText: 'Модификация',
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
            shrinkWrap: true,
          )));
}
