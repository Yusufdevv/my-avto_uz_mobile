import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: dark.withOpacity(0.08),
                offset: const Offset(0, 8),
                blurRadius: 19,
              ),
              BoxShadow(
                color: dark.withOpacity(0.16),
                offset: const Offset(0, -1),
                blurRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                Theme.of(context).extension<ThemedIcons>()!.imageUrl,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppIcons.bell),
              ),
            ],
          ),
        ),
      );

  @override
  Size get preferredSize => AppBar().preferredSize;
}
