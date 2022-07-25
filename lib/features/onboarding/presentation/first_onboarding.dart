import 'package:auto/features/onboarding/presentation/widgets/onboarding_bottom_item.dart';
import 'package:auto/features/onboarding/presentation/widgets/stacked__onboarding_widget.dart';
import 'package:flutter/material.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Expanded(flex: 3, child: StackedOnBoardingWidget()),
        Expanded(flex: 2, child: OnBoardingBottom())
      ],
    ),
  );
}
