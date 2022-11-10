import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InvoiceInProgress extends StatelessWidget {
  const InvoiceInProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          hasBackButton: true,
          title: 'Услуга',
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Lottie.asset(
                  'assets/lottie/waiting.json',
                ),
                Text(
                  'Оплата в ожидании',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                Column(
                  children: [
                    OrangeButton(
                        color: border,
                        content: Text('Обновить страницу',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                        onTap: () {}),
                    const SizedBox(
                      height: 16,
                    ),
                    OrangeButton(
                        color: orange,
                        content: Text('Вернутся к объявлениям',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                        onTap: () {
                          Navigator.of(context)
                              .push(fade(page: const CarSingleScreen()));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
