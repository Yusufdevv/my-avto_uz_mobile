import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatefulWidget {
  final ImageBloc imageBloc;

  const CameraBottomSheet({
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<CameraBottomSheet> createState() => CameraBottomSheetState();
}

class CameraBottomSheetState extends State<CameraBottomSheet> {
  List<String> titleList = [
    LocaleKeys.camera,
    LocaleKeys.choose_photo,
  ];
  List<String> img = [
    AppIcons.camera,
    AppIcons.photo,
  ];

  int selectedCamera = 0;
  late final ValueChanged<ImageSource> imageType;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: widget.imageBloc,
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                Text(
                  LocaleKeys.attach_file.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                WScaleAnimation(
                    child:
                        SvgPicture.asset(AppIcons.close, width: 32, height: 32),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
            const SizedBox(height: 12),
            ListView.separated(
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .greyToDarkRider,
              ),
              itemCount: titleList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => _ItemSelect(
                camera: img[index],
                text: titleList[index].tr(),
                imageType: ImageSource.gallery,
                onTapImageType: (_imageType) {
                  if (index == 0) {
                    widget.imageBloc
                        .add(const GetImage(source: ImageSource.camera));
                  } else {
                    widget.imageBloc
                        .add(const GetImage(source: ImageSource.gallery));
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
            WButton(
              margin: const EdgeInsets.symmetric(vertical: 20),
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.confirm.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      );
}

class _ItemSelect extends StatelessWidget {
  final String text;
  final ValueChanged<ImageSource> onTapImageType;
  final ImageSource imageType;
  final String camera;

  const _ItemSelect(
      {required this.text,
      required this.imageType,
      required this.onTapImageType,
      required this.camera});

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () => onTapImageType(imageType),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              SvgPicture.asset(camera),
              const SizedBox(width: 8),
              Expanded(
                child: Text(text,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      );
}
