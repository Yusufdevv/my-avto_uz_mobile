import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/pages/commercial_body_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  // phone: +998 90 478 17 17
  // parol: parol123
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(108),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WAppBar(
                    title: 'Лёгкий коммерческий транспорт',
                    extraActions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: WScaleAnimation(
                          onTap: () {}/* => Navigator.push(context, fade(page: const SelectCarScreen()))*/,
                          child: SvgPicture.asset(AppIcons.searchWithHeart, width: 20, height: 20),
                        ),
                      ),
                    ],
                  ),
                  CommercialTab(
                    tabController: tabController,
                    tabLabels: const ['Все', 'Новые', 'С пробегом'],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                CommercialBodyScreen(),
                CommercialBodyScreen(),
                CommercialBodyScreen(),
              ],
            ),
          ),
        ),
      );
}
