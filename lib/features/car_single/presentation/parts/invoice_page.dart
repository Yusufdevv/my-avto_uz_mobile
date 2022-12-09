import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/widgets/invoice_in_progress.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        appBar: const WAppBar(
          hasUnderline: true,
          hasBackButton: true,
          title: 'Услуга',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Продлить на 7 дней',
                style: Theme.of(context).textTheme.headline1,
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
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const Spacer(),
                          Text(
                            '15 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
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
                            'Окончание срока',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const Spacer(),
                          Text(
                            '18.11.2022',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
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
                            'Итого:',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const Spacer(),
                          Text(
                            '15 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Способ оплаты',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectPaymentItem(
                        onTap: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                        value: 1,
                        groupValue: value,
                        color: value == 1 ? lavanda : borderCircular,
                        iconPath: AppImages.apels,
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
                        iconPath: AppImages.clickpng,
                        borderColor: value == 2 ? purple : border,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectPaymentItem(
                      onTap: (val) {
                        setState(() {
                          value = val;
                        });
                      },
                      value: 3,
                      color: value == 3 ? lavanda : borderCircular,
                      groupValue: value,
                      iconPath: AppImages.paymepng,
                      borderColor: value == 3 ? purple : border,
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
                      value: 4,
                      color: value == 4 ? lavanda : borderCircular,
                      groupValue: value,
                      iconPath: AppImages.hello,
                      borderColor: value == 4 ? purple : border,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Column(
                    children: [
                      Text.rich(TextSpan(
                          style: const TextStyle(
                            fontSize: 27,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Вы соглашаетесь с ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            TextSpan(
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                //make link blue and underline
                                text:
                                    'Условиями использования и Политикой конфиденциальности',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    const url =
                                        'https://jobo.uz/companies/limonpay-1';
                                    final urllaunchable = await canLaunch(url);
                                    if (urllaunchable) {
                                      await launch(url);
                                    } else {
                                      print("URL can't be launched.");
                                    }
                                  }),
                            const TextSpan(
                              text: ' вы подтверждаете свое согласие',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ])),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OrangeButton(
                    shadowColor: white,
                    color: orange,
                    content: Text('Подтвердить',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 14)),
                    onTap: () {
                      Navigator.of(context)
                          .push(fade(page: const InvoiceInProgress()));
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom +16,)

                ],
              ),
            ],
          ),
        ),
      );
}
