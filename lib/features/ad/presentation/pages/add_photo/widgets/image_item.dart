import 'dart:io';

import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ImageItem extends StatelessWidget {
  final String image;

  const ImageItem({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            height: 109,
            width: 109,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                      File(image),
                    ))),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: WScaleAnimation(
                onTap: () {
                  context.read<ImageBloc>().add(DeleteImage(imageUrl: image));
                },
                child: SvgPicture.asset(AppIcons.closeSquare)),
          ),
        ],
      );
}
