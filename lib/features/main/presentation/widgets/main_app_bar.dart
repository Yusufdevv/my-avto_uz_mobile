import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/notification/notifiaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
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
        child: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .push(fade(page: const NotificationPage())),
                child: SvgPicture.asset(
                  AppIcons.bellWithCircle,
                ),
              ),
            )
          ],
          title: SvgPicture.asset(
            Theme.of(context).extension<ThemedIcons>()!.imageUrl,
          ),
        ),
      );

  // SafeArea(
  //       child: Container(
  //         height: kToolbarHeight,
  //         padding: const EdgeInsets.only(left: 20),
  //         decoration: BoxDecoration(
  //           color: white,
  //           boxShadow: [
  //             BoxShadow(
  //               color: dark.withOpacity(0.08),
  //               offset: const Offset(0, 8),
  //               blurRadius: 19,
  //             ),
  //             BoxShadow(
  //               color: dark.withOpacity(0.16),
  //               offset: const Offset(0, -1),
  //               blurRadius: 0,
  //             ),
  //           ],
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             SvgPicture.asset(
  //               Theme.of(context).extension<ThemedIcons>()!.imageUrl,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(right: 16),
  //               child: GestureDetector(
  //                 onTap: () => Navigator.of(context, rootNavigator: true)
  //                     .push(fade(page: const NotificationPage())),
  //                 child: SvgPicture.asset(
  //                   AppIcons.bellWithCircle,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     )
  //     ;

  @override
  Size get preferredSize => AppBar().preferredSize;
}
