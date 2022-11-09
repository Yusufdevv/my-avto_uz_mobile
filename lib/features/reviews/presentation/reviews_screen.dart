import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/reviews_body_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/review_tab_bar.dart';
import 'package:auto/features/reviews/presentation/pages/select_brand_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen>
    with SingleTickerProviderStateMixin {
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
            statusBarColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(108),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WAppBar(title: 'Отзывы'),
                  ReviewTabBar(
                    tabController: tabController,
                    tabLabels: const ["Легковые", "Коммерческие", "Мото"],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                ReviewsBodyScreen(),
                ReviewsBodyScreen(),
                ReviewsBodyScreen(),
              ],
            ),
          ),
        ),
      );
}
