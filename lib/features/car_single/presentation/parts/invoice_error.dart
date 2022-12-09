import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InvoiceError extends StatelessWidget {
  const InvoiceError({Key? key}) : super(key: key);

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
                  'assets/lottie/error.json',
                ),
                Text(
                  'Услуга успешно подключена',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                Column(
                  children: [
                    OrangeButton(
                        color: border,
                        content: Text('Повторить попытку',
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
                        content: Text('Вернутся на объявление',
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
