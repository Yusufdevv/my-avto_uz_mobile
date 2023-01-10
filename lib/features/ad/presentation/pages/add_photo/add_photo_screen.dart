import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late ImageBloc imageBloc;

  @override
  void initState() {
    imageBloc = ImageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: imageBloc,
        child: Scaffold(
          body: BaseWidget(
            hasButton: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ImageBloc, ImageState>(
                  builder: (context, state) => PhotoItem(images: state.images),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Фото 360°',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: grey),
                  ),
                ),
                WScaleAnimation(
                  onTap: () {},
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: purple),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .ghostWhiteToUltramarine10,
                    ),
                    child: Center(
                      child: SvgPicture.asset(AppIcons.circlePlus),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
