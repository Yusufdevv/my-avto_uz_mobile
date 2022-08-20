import 'dart:async';

import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/onboarding/presentation/first_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:lottie/lottie.dart';

class SplashSc extends StatefulWidget {
  @override
  _SplashScState createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FirstOnBoarding())));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                Theme.of(context).extension<ThemedIcons>()!.autoUzLightDark,
              ),
              const Spacer(),
              //Lottie.asset('assets/lottie/red_car.json', height: 86),
            ],
          ),
        ),
      );
}
