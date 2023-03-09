import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/image_item.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/bloc/image/image_bloc.dart';

class StsImageItemWidget extends StatefulWidget {
  final List<String> images;
  final VoidCallback onTap;

  const StsImageItemWidget(
      {required this.images, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<StsImageItemWidget> createState() => _StsImageItemWidgetState();
}

class _StsImageItemWidgetState extends State<StsImageItemWidget> {
  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? WScaleAnimation(
          onTap: widget.onTap,
          child: Container(
            alignment: Alignment.center,
            height: 110,
            width: double.infinity,
            margin:
                const EdgeInsets.only(right: 20, left: 20, top: 8, bottom: 20),
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
      : Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if(widget.images.length<2)
              Expanded(
                child: WScaleAnimation(
                  onTap: widget.onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      height: 109,
                      width: 109,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: purple),
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .ghostWhiteToUltramarine10,
                      ),
                      child: const PlusCircle(),
                    ),
                  ),
                ),
              ),
              ...List.generate(
                  widget.images.length,
                  (index) => Expanded(
                    flex: 2,
                    child: Padding(
                          padding: EdgeInsets.only(right: index == 0 ? 8 : 0),
                          child: Stack(
                            children: [
                              Container(
                                height: 109,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: purple),
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .ghostWhiteToUltramarine10,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(File(widget.images[index])),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: WScaleAnimation(
                                    onTap: () {
                                      context.read<ImageBloc>().add(
                                          DeleteImageEvent(
                                              imageUrl: widget.images[index]));
                                    },
                                    child:
                                        SvgPicture.asset(AppIcons.closeSquare)),
                              ),
                            ],
                          ),
                        ),
                  )).toList(),
              if(widget.images.length==1)
             const Expanded(child: SizedBox()),
            ],
          ),
        );
}
