import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/mileage/mileage_image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MileageImageItem extends StatelessWidget {
  final VoidCallback onTap;
  final String? image;

  const MileageImageItem({required this.onTap, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image == null || image!.isEmpty) {
      return WScaleAnimation(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 82,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: purple),
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .ghostWhiteToUltramarine10,
          ),
          child: const PlusCircle(),
        ),
      );
    }
    return Stack(
      children: [
        Container(
          height: 140,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(image ?? '')),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: WScaleAnimation(
              onTap: () {
                context.read<MileageImageBloc>().add(DeleteImage());
              },
              child: SvgPicture.asset(AppIcons.closeSquare)),
        ),
      ],
    );
  }
}
