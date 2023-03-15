import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReelsPhotoItem extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const ReelsPhotoItem({required this.image, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            height: 116,
            width: 104,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: dividerColor,
              ),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(File(image)),
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 16,
            child: WScaleAnimation(
                onTap: onTap, child: SvgPicture.asset(AppIcons.closeSquare)),
          ),
        ],
      );
}
