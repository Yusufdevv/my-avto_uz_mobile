import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/mileage/mileage_image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MileageImageItem extends StatefulWidget {
  final String? image;

  const MileageImageItem({required this.image, Key? key}) : super(key: key);

  @override
  State<MileageImageItem> createState() => _MileageImageItemState();
}

class _MileageImageItemState extends State<MileageImageItem> {
  @override
  Widget build(BuildContext context) => widget.image == null|| widget.image!.isEmpty
      ? WScaleAnimation(
          onTap: () {
            context.read<MileageImageBloc>().add(const PickMileageImage());
          },
          child: Container(
            alignment: Alignment.center,
            height: 82,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: purple),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .ghostWhiteToUltramarine10,
            ),
            child: const PlusCircle(),
          ),
        )
      : Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(
                File(widget.image!),
              ),
            ),
          ),
        );
}
