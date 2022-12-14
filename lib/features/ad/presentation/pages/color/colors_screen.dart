import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/presentation/pages/color/widgets/colors_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ColorsScreen extends StatefulWidget {
  final VoidCallback onTap;

  const ColorsScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  final List<Color> colorsList = [
    black,
    silver,
    white,
    complaintColor,
    yellow,
    neonCarrot
  ];
  final List<String> colorsNameList = [
    'Черный',
    'Серебристый',
    'Белый',
    'Бордовый',
    'Желтый',
    'Оранжевыйq',
  ];
  String currentId = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          onTap: currentId.isEmpty ? () {} : widget.onTap,
          padding: const EdgeInsets.only(top: 16),
          child: GridView.builder(
            itemBuilder: (context, index) => ColorsItem(
              color: colorsList[index],
              colorName: colorsNameList[index],
              onTap: (id) {
                setState(() {
                  currentId = id;
                });
              },
              id: index.toString(),
              isSelected: index.toString() == currentId,
            ),
            itemCount: 6,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.5),
          ),
        ),
      );
}
