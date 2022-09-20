import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_bottom_sheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (c) => WBottomSheet(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              children: [
                GestureDetector(
                  onTap: () async {
                    await takePhoto(isCamera: false)
                        .then((value) => onSuccess(value));
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.photo,
                          color: Colors.black38,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Gallery')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () async {
                    await takePhoto(isCamera: true)
                        .then((value) => onSuccess(value));
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.black38,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Camera',
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
            'Фото',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(
            width: 48,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) => Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(
                                  state.registerModel.image.isNotEmpty
                                      ? state.registerModel.image
                                      : AppImages.imagePlaceHolder)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 21,
                    ),
                    WButton(
                      onTap: () {
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
                      text: 'Добавить фото',
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
                )
              ],
            ),
          )
        ],
      );
}
