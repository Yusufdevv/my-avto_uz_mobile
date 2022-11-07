import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget commentSeen() => SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppIcons.comment,
            height: 13,
          ),
          const Text(
            '9',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff696974),
            ),
          ),
          Container(
            height: 16,
            width: 1,
            color: const Color(0xffF1F1F5),
          ),
          SvgPicture.asset(
            AppIcons.eye,
            height: 13,
          ),
          const Text(
            '296',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff696974),
            ),
          ),
        ],
      ),
    );
