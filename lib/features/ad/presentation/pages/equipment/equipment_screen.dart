import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  int selectedIndex = 0;
  final List<String> titleList = [
    'xDrive40i 3.0 Steptronic (340 л.с.)',
    'xDrive50i 4.4 Steptronic (462 л.с.)'
  ];

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BaseWidget(
            hasButton: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Покупатели чаще звонят по объявлениям,  в которых указана комплектация',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .aluminumToDolphin),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
