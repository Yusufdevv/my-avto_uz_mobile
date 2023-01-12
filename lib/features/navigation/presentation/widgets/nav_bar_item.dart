import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/navigation/domain/entities/navbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final String? avatar;
  final NavBar navBar;
  //final Function onDoubleTap;

  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    this.avatar,
    //required this.onDoubleTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 4),
        width: double.maxFinite,
        child: Column(
          children: [
            if (avatar == null) ...{
              Center(
                child: currentIndex == navBar.id
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SvgPicture.asset(
                          navBar.icon,
                          height: 24,
                          width: 24,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SvgPicture.asset(
                          navBar.outlinedIcon,
                          height: 24,
                          width: 24,
                        ),
                      ),
              ),
            } else ...{
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: currentIndex == navBar.id ? darkGray : grey,
                      width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedImage(
                    imageUrl: avatar!,
                  ),
                ),
              ),
            },
            const SizedBox(
              height: 4,
            ),
            if (currentIndex == navBar.id)
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2), color: purple),
              )
            else
              const SizedBox(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                navBar.title.tr(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: currentIndex == navBar.id
                    ? Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400)
                    : Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: greyText),
              ),
            ),
          ],
        ),
      );
}
