import 'package:auto/features/car_single/presentation/parts/invoice_status_widget.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InvoiceInProgress extends StatelessWidget {
  const InvoiceInProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: WAppBar(
        hasUnderline: true,
        hasBackButton: true,
        title: LocaleKeys.service.tr(),
      ),
      body: InvoiceStatusWidget(
          lottie: 'assets/lottie/waiting.json',
          title: LocaleKeys.payment_pending.tr(),
          onTapToAds: () {
            Navigator.of(context).pop();
          },
          onTapSecondButton: () {},
          hasSecondButton: true)

      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Spacer(),
      //         Lottie.asset(
      //           'assets/lottie/waiting.json',
      //         ),
      //         Text(
      //           LocaleKeys.payment_pending.tr(),
      //           style: Theme.of(context).textTheme.displayLarge,
      //         ),
      //         const Spacer(),
      //         Column(
      //           children: [
      //             OrangeButton(
      //                 shadowColor: white,
      //                 color: border,
      //                 content: Text(LocaleKeys.refresh_the_page.tr(),
      //                     style: Theme.of(context)
      //                         .textTheme
      //                         .displayMedium!
      //                         .copyWith(
      //                             fontSize: 14, fontWeight: FontWeight.w600)),
      //                 onTap: () {}),
      //             const SizedBox(
      //               height: 16,
      //             ),
      //             OrangeButton(
      //                 shadowColor: white,
      //                 color: orange,
      //                 content: Text('Вернутся к объявлениям',
      //                     style: Theme.of(context)
      //                         .textTheme
      //                         .headlineMedium!
      //                         .copyWith(
      //                             fontSize: 14, fontWeight: FontWeight.w600)),
      //                 onTap: () {
      //                   // Navigator.of(context)
      //                   //     .push(fade(page: const CarSingleScreen()));
      //                 }),
      //             SizedBox(
      //               height: MediaQuery.of(context).padding.bottom + 16,
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      );
}
