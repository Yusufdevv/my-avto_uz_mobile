import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClueBtsht extends StatelessWidget {
  const ClueBtsht({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: 16 + MediaQuery.of(context).padding.bottom),
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
                'Подсказка',
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
          const SizedBox(height: 3),
          const Divider(height: 32),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 77 + MediaQuery.of(context).padding.bottom),
        ]),
      );
}
