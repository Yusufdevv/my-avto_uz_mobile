import 'dart:async';

import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SplashSc extends StatefulWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => SplashSc());

  @override
  _SplashScState createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  Timer? _timer;
  @override
  void initState() {
    print('intstatega krdi');
    // if (mounted) {
    //   _timer = Timer(const Duration(seconds: 5), () async {
    //     await Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) {
    //            print('=>=>=>=> throvine to the first on boarding page <=<=<=<=');
    //       return const FirstOnBoarding();
    //     }));
    //   });
    // }

    super.initState();

    // if(mounted) { Future.delayed(const Duration(seconds: 3)).then((value) =>
    //      Navigator.pushReplacement(context,
    //          MaterialPageRoute(builder: (context) => const FirstOnBoarding())));}
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
              Lottie.asset('assets/lottie/red_car.json', height: 86),
            ],
          ),
        ),
      );
}
