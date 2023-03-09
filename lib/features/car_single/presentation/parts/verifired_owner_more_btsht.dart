import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifiredOwnerMoreBtsht extends StatefulWidget {
  const VerifiredOwnerMoreBtsht({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifiredOwnerMoreBtsht> createState() => VerifiredOwnerMoreBtshtState();
}

class VerifiredOwnerMoreBtshtState extends State<VerifiredOwnerMoreBtsht> {
  List<String> titleList = [
    LocaleKeys.reapplication,
    LocaleKeys.delete,
  ];

  List<String> img = [
    AppIcons.camera,
    AppIcons.photo,
  ];

  @override
  Widget build(BuildContext context) => Container(
    padding:   EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 16+MediaQuery.of(context).padding.bottom),
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
            LocaleKeys.actions_single.tr(),
            style: Theme.of(context).textTheme.displayLarge,
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
      const SizedBox(height: 16),
      ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1,
          color:
          Theme.of(context).extension<ThemedColors>()!.greyToDarkRider,
        ),
        itemCount: titleList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _ItemSelect(
          camera: img[index],
          text: titleList[index].tr(),
          onTapImageType: () {
            // Navigator.of(context).pop(_imageType);
          },
        ),
      )
    ]),
  );
}

class _ItemSelect extends StatelessWidget {
  final String text;
  final VoidCallback onTapImageType;
  final String camera;

  const _ItemSelect(
      {required this.text,
        required this.onTapImageType,
        required this.camera});

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap: () => onTapImageType,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SvgPicture.asset(camera),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          const SizedBox(width: 6),
        ],
      ),
    ),
  );
}
