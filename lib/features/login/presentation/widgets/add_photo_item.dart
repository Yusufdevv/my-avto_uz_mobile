import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_bottom_sheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_divider.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoItem extends StatefulWidget {
  final VoidCallback onTap;
  const AddPhotoItem({required this.onTap, Key? key}) : super(key: key);

  @override
  State<AddPhotoItem> createState() => _AddPhotoItemState();
}

class _AddPhotoItemState extends State<AddPhotoItem> {
  @override
  void initState() {
    context.read<RegisterBloc>().add(RegisterEvent.changeImage(path: ''));
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();

  void showImageBottomSheet(
      {required Function(String) onSuccess, required BuildContext context}) {
    final mediaQuery = MediaQuery.of(context);
    showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (c) => WBottomSheet(
              contentPadding: EdgeInsets.fromLTRB(
                  16, 20, 16, 12 + mediaQuery.padding.bottom),
              children: [
                Row(
                  children: [
                    Text(LocaleKeys.photo.tr(),
                        style: Theme.of(context).textTheme.displayLarge),
                    const Spacer(),
                    WScaleAnimation(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SvgPicture.asset(AppIcons.close,
                              width: 32, height: 32),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
                const SizedBox(height: 12),
                WScaleAnimation(
                  onTap: () async {
                    await takePhoto(isCamera: true)
                        .then((value) => onSuccess(value));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.icCamera),
                        const SizedBox(width: 8),
                        Text(
                          LocaleKeys.camera.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const WDivider(),
                const SizedBox(height: 12),
                WScaleAnimation(
                  onTap: () async {
                    await takePhoto(isCamera: false)
                        .then((value) => onSuccess(value));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.gallery),
                        const SizedBox(width: 8),
                        Text(
                          LocaleKeys.choose_photo.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ));
  }

  Future<String> takePhoto({required bool isCamera}) async {
    var type = ImageSource.gallery;
    if (isCamera) {
      type = ImageSource.camera;
    }

    final image = await _picker.pickImage(
      source: type,
    );
    return image!.path;
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  LocaleKeys.photo.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 48),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: const BoxDecoration(
                          color: solitude,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImages.imagePlaceHolder)),
                        ),
                        child: state.registerModel.image.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: Image.file(
                                  File(state.registerModel.image),
                                  fit: BoxFit.cover,
                                ))
                            : null,
                      ),
                      const SizedBox(width: 21),
                      WButton(
                        onTap: () {
                          widget.onTap();
                          showImageBottomSheet(
                              onSuccess: (image) {
                                context.read<RegisterBloc>().add(
                                    RegisterEvent.changeImage(path: image));
                                Navigator.pop(context);
                              },
                              context: context);
                        },
                        borderRadius: 4,
                        height: 28,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        text: state.registerModel.image.isEmpty
                            ? LocaleKeys.add_photo.tr()
                            : LocaleKeys.change_photo.tr(),
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: grey),
                        textColor: grey,
                        color: solitude,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToWhite35,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
