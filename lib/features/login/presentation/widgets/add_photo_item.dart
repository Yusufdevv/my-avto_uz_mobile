import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_bottom_sheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_divider.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/widgets/teke_image_bottomsheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoItem extends StatefulWidget {
  const AddPhotoItem({Key? key}) : super(key: key);

  @override
  State<AddPhotoItem> createState() => _AddPhotoItemState();
}

class _AddPhotoItemState extends State<AddPhotoItem> {
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
                GestureDetector(
                  onTap: () async {
                    await takePhoto(isCamera: true)
                        .then((value) => onSuccess(value));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.icCamera),
                      const SizedBox(width: 8),
                      Text(
                        'Камера',
                        style:
                            Theme.of(context).textTheme.headline1!.copyWith(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const WDivider(),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () async {
                    await takePhoto(isCamera: false)
                        .then((value) => onSuccess(value));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.gallery),
                        const SizedBox(width: 8),
                        Text(
                          'Выбрать фото',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 + MediaQuery.of(context).padding.bottom,
                )
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
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.photo.tr(),
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        print('image');
                        print(state.registerModel.image);
                        return Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    state.registerModel.image.isNotEmpty
                                        ? state.registerModel.image
                                        : AppImages.imagePlaceHolder)),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 21),
                    WButton(
                      onTap: () {
                        //showTakeImageBottomSheet(context);
                        showImageBottomSheet(
                            onSuccess: (image) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterEvent.changeImage(path: image));
                              Navigator.pop(context);
                            },
                            context: context);
                      },
                      borderRadius: 4,
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      text: LocaleKeys.add_photo.tr(),
                      textColor: grey,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitudeToBastille,
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
      );
}
