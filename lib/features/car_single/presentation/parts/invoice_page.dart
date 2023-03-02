// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_in_progress.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  int value = 0;
  int groupValue = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: WAppBar(
          hasUnderline: true,
          hasBackButton: true,
          title: LocaleKeys.service.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Продлить на 7 дней',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: borderCircular,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12, right: 12, bottom: 6, left: 12),
                      child: Row(
                        children: [
                          Text(
                            'Продлить на 7 дней',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const Spacer(),
                          Text(
                            '15 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12, left: 12, bottom: 12),
                      child: Divider(
                        color: dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12, bottom: 12, left: 12),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.end_of_term.tr(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const Spacer(),
                          Text(
                            '18.11.2022',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                        ),
                        const Expanded(
                          child: DottedLine(
                            dashColor: dividerColor,
                            dashLength: 9,
                          ),
                        ),
                        Container(
                          height: 12,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12, bottom: 12, left: 12),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.total.tr(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const Spacer(),
                          Text(
                            '15 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                LocaleKeys.payment_method.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectPaymentItem(
                        onTap: (val)  {
                          setState(() {
                            value = val;
                          });
                        },
                        value: 1,
                        groupValue: value,
                        color: value == 1 ? lavanda : borderCircular,
                        iconPath: AppIcons.payme,
                        borderColor: value == 1 ? purple : border,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SelectPaymentItem(
                        onTap: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                        value: 2,
                        color: value == 2 ? lavanda : borderCircular,
                        groupValue: value,
                        iconPath: AppIcons.kpay,
                        borderColor: value == 2 ? purple : border,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Column(
                    children: const  [
                      Text.rich(
                          TextSpan(
                          // style: const TextStyle(
                          //   fontSize: 27,
                          // ),
                          children: [
                            TextSpan(
                              text: 'Вы соглашаетесь с ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                //make link blue and underline
                                text:
                                    'Условиями использования и Политикой конфиденциальности',
                                ),
                            TextSpan(
                              text: ' вы подтверждаете свое согласие',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ])),
                    ],
                  ),
                  const SizedBox(height: 16),
                  WButton(
                    isDisabled: value < 1,
                    disabledColor: disabledButton,
                    text: LocaleKeys.confirm.tr(),
                    color: orange,
                    onTap: () {
                      Navigator.of(context)
                          .push(fade(page: const InvoiceInProgress()));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
