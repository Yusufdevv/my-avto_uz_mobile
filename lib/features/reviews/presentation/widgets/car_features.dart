import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget features(String text) => Container(
      padding: const EdgeInsets.only(left: 16, right: 23.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: LightThemeColors.headline1,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SvgPicture.asset(
            AppIcons.chevronRight,
            color: LightThemeColors.darkGreyToWhite,
          ),
        ],
      ),
    );
