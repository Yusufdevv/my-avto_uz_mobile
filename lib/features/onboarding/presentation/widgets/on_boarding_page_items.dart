import 'package:auto/features/onboarding/presentation/widgets/base_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingItems extends StatelessWidget {
  final String image;
  final String title;
  final String icon;
  final bool hasSecondText;
  final String secondText;
  final String thirdText;
  const OnBoardingItems({required this.icon, this.secondText = '',this.thirdText = '', this.hasSecondText = false, required this.title, required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: (){},
            child: Text('Пропустить', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15, fontWeight: FontWeight.w400),)
          ),
        ),
      ),
      Image.asset(image),
      Padding(
        padding: const EdgeInsets.only(left: 32),
        child: RichText(text: TextSpan(
          children: [
           WidgetSpan(child: Image.asset(icon)),
           TextSpan(text: title, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 36),),
            TextSpan(text: secondText, style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 36, fontWeight: FontWeight.w700)),
            TextSpan(text: thirdText, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 36),),
          ]
        ),),
      ),
      const SizedBox(height: 24,),
    ],
  );
}
