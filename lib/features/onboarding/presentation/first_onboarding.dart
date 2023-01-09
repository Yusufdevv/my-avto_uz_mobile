import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/onboarding/presentation/widgets/onboarding_bottom_item.dart';
import 'package:auto/features/onboarding/presentation/widgets/stacked__onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor:
              Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor:
              Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          body: Column(
            children: [
              Expanded(flex: 3, child: StackedOnBoardingWidget()),
              const Expanded(flex: 2, child: OnBoardingBottom())
            ],
          ),
        ),
      );
}
