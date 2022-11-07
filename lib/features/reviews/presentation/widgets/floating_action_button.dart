import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/add_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget floatingActionButton(BuildContext context) => FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          context: context,
          builder: (context) => const ModalBottomSheet(),
        );
      },
      backgroundColor: LightThemeColors.button,
      child: SvgPicture.asset(
        AppIcons.plus,
        color: Colors.white,
        height: 22,
        width: 22,
      ),
    );
