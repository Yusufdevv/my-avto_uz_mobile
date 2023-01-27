import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/plus_circle.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPhotoScreen extends StatefulWidget {
  final Function(List<String>) onImageChanged;
  const AddPhotoScreen({required this.onImageChanged, Key? key})
      : super(key: key);

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
            headerText: 'Фото',
            extraAction: [
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(AppIcons.infoCircle, height: 24)),
              ),
              const Spacer()
            ],
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, postingAdState) {
                print(
                    '=> => => =>     state images lenth: ${postingAdState.gallery.length}    <= <= <= <=');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocConsumer<ImageBloc, ImageState>(
                      listener: (context, state) =>
                          widget.onImageChanged(state.images),
                      builder: (context, state) =>
                          PhotoItem(images: postingAdState.gallery),
                    ),
                    const SizedBox(height: 16),
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
                          alignment: Alignment.center,
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
                          child: const PlusCircle()),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
}
