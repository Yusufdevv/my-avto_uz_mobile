import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InvoiceStatusWidget extends StatelessWidget {
  final String lottie;
  final String title;
  final String secondBtnTitle;
  final VoidCallback onTapToAds;
  final VoidCallback onTapSecondButton;
  final bool hasSecondButton;

  const InvoiceStatusWidget({
    required this.lottie,
    required this.title,
    required this.secondBtnTitle,
    required this.onTapToAds,
    required this.onTapSecondButton,
    this.hasSecondButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Lottie.asset(lottie),
              Text(
                title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(),
              Column(
                children: [
                  if (hasSecondButton)
                    OrangeButton(
                        shadowColor: white,
                        color: border,
                        content: Text(secondBtnTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                        onTap: onTapSecondButton),
                  const SizedBox(height: 16),
                  OrangeButton(
                      shadowColor: white,
                      color: orange,
                      content: Text(LocaleKeys.back_to_ads.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                      onTap: onTapToAds),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 16,
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
