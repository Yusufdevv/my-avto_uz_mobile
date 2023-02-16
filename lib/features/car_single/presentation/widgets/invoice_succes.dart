import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InvoiceSucces extends StatelessWidget {
  const InvoiceSucces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          hasBackButton: true,
          hasUnderline: true,
          title: LocaleKeys.service.tr(),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Lottie.asset(
                  'assets/lottie/succes.json',
                  repeat: false,
                ),
                Text(
                  LocaleKeys.service_connected_successfully.tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                OrangeButton(
                    shadowColor: white,
                    color: orange,
                    content: Text(LocaleKeys.back_to_ad.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(fade(page: const CarSingleScreen()));
                    }),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 16,
                )
              ],
            ),
          ),
        ),
      );
}
