import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/scrolled_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatefulWidget {
  const CameraBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraBottomSheet> createState() => CameraBottomSheetState();
}

class CameraBottomSheetState extends State<CameraBottomSheet> {
  List<String> titleList = [
    'Камера',
    'Выбрать фото',
  ];
  List<String> img = [
    AppIcons.camera,
    AppIcons.photo,
  ];

  int selectedCamera = 0;
  late final ValueChanged<ImageSource> imageType;
  @override
  Widget build(BuildContext context) => ScrolledBottomSheet(
        stackedWButton: WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Подтвердить',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        hasHeader: true,
        title: 'Прикрепить файл',
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 1,
              color: border,
            ),
            itemCount: titleList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => _ItemSelect(
                camera: img[index],
                text: titleList[index],
                imageType: ImageSource.gallery,
                onTapImageType: (_imageType) {
                  imageType(_imageType);
                  Navigator.pop(context);
                }),
          ),
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: border)),
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
