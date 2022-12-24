// ignore_for_file: unnecessary_string_escapes

import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget carModelandRating() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Kia K5 GT-Line AWD (107 л.с.)',
          style: TextStyle(
            color: Color(0xff92929D),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppIcons.star),
            const SizedBox(width: 8),
            const Text(
              '3.6',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ],
    );
