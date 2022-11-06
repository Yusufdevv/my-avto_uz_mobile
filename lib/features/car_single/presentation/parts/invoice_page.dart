import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
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
        appBar: const WAppBar(
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
                      child: Divider(),
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
                        const Expanded(child: Divider()),
                        // SizedBox(
                        //   height: 12,
                        //   child: ListView.separated(
                        //       itemBuilder: (context, index) => Container(
                        //             height: 1,
                        //             width: 10,
                        //           ),
                        //       separatorBuilder: (context, index) => SizedBox(
                        //             width: 3,
                        //           ),
                        //       itemCount: 5),
                        // ),
                        Container(
                          height: 12,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SelectGenderItem(
                        onTap: () {
                          setState(() {
                            value = 1;
                          });
                        },
                        value: value,
                        groupValue: 1,
                        color: value ==1 ? lavanda : borderCircular,
                        iconPath: AppIcons.payme,
                        borderColor: value == 1 ? purple : border,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SelectGenderItem(
                        onTap: () {
                          setState(() {
                            value = 2;
                          });
                        },
                        value: value,
                        color: value == 2 ? lavanda : borderCircular,
                        groupValue: 2,
                        iconPath: AppIcons.apelsin,
                        borderColor: value == 2 ? purple : border,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectGenderItem(
                      onTap: () {
                        setState(() {
                          value = 3;
                        });
                      },
                      value: value,
                      color: value == 3 ? lavanda : borderCircular,
                      groupValue: 3,
                      iconPath: AppIcons.click,
                      borderColor: value == 3 ? purple : border,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SelectGenderItem(
                      onTap: () {
                        setState(() {
                          value = 4;
                        });
                      },
                      value: value,
                      color: value == 4 ? lavanda : borderCircular,
                      groupValue: 4,
                      iconPath: AppIcons.upay,
                      borderColor: value == 4 ? purple : border,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
