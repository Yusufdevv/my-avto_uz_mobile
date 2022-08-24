import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison_page2.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddNewCar extends StatelessWidget {
  const AddNewCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
              context, fade(page: const ComparisonPage2(numberOfAddedCars: 3)));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 34),
          width: MediaQuery.of(context).size.width / 2 - 22,
          height: 216,
          decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: purple),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(6),
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: purple,
                    ),
                    child: SvgPicture.asset(AppIcons.addCarIcon)),
                const SizedBox(height: 16),
                const Text(
                  'Добавить объявление',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14, color: purple),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      );
}
