import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class PlusMinusScreen extends StatelessWidget {
  final List<String> titles;
  final List<int> negativesCount;
  final List<int> positivesCount;
  const PlusMinusScreen(
      {required this.titles,
      required this.negativesCount,
      required this.positivesCount,
      super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            const WAppBar(title: 'Стоимость обслуживания', centerTitle: false),
        body: ListView.separated(
          padding: EdgeInsets.only(left: 16, top: 28),
          itemCount: titles.length,
          separatorBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: solitude,
              borderRadius: BorderRadius.circular(2),
            ),
            height: 1,
            width: double.maxFinite,
          ),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titles[index],
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: dark, fontSize: 16),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: positivesCount[index].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: green, fontSize: 16),
                      ),
                      TextSpan(
                        text: ' / ',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: dividerColor, fontSize: 13),
                      ),
                      TextSpan(
                        text: negativesCount[index].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: red, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
