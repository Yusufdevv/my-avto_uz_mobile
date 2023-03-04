// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/bloc/invoice_bloc/invoice_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/car_single/presentation/widgets/tarif_item.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({required this.announcementId ,Key? key}) : super(key: key);
  final int announcementId;
  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

// ignore: prefer_mixin
class _InvoicePageState extends State<InvoicePage> with WidgetsBindingObserver {
  int value = 0;
  int groupValue = 1;
  late InvoiceBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InvoiceBloc()..add(GetTarifsEvent());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          backgroundColor: white,
          appBar: WAppBar(
            hasUnderline: true,
            hasBackButton: true,
            title: LocaleKeys.service.tr(),
          ),
          body: BlocBuilder<InvoiceBloc, InvoiceState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.status.isSubmissionSuccess) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Продлить obyavleniya',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(height: 16),
                              ...List.generate(state.tarifs.length, (index) {
                                final item = state.tarifs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TarifItem(
                                    id: item.id ?? -1,
                                    type: item.type ?? '',
                                    amount: item.amount ?? '',
                                    date: '18.11.2022',
                                  ),
                                );
                              }),
                              ///
                              // Expanded(
                              //   child: ListView.builder(
                              //     // padding: const EdgeInsets.only(bottom: 16),
                              //     itemBuilder: (context, index) {
                              //       final item = state.tarifs[index];
                              //       return Padding(
                              //         padding: const EdgeInsets.only(bottom: 16),
                              //         child: TarifItem(
                              //           id: item.id ?? -1,
                              //           type: item.type ?? '',
                              //           amount: item.amount ?? '',
                              //           date: '18.11.2022',
                              //         ),
                              //       );
                              //     },
                              //     itemCount: state.tarifs.length,
                              //   ),
                              // ),
                              const SizedBox(height: 16),

                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            LocaleKeys.payment_method.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: 12),
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
                                    color: value == 1
                                        ? lavanda
                                        : borderCircular,
                                    iconPath: AppIcons.payme,
                                    borderColor:
                                    value == 1 ? purple : border,
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
                                    color: value == 2
                                        ? lavanda
                                        : borderCircular,
                                    groupValue: value,
                                    iconPath: AppIcons.kpay,
                                    borderColor:
                                    value == 2 ? purple : border,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: const [
                              Text.rich(TextSpan(
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
                            isLoading: state.payStatus.isSubmissionInProgress,
                            isDisabled: value < 1,
                            disabledColor: disabledButton,
                            text: LocaleKeys.confirm.tr(),
                            color: orange,
                            onTap: () async {
                              bloc.add(PayInvoiceEvent(announcement: 286, provider: 'payme', tariffType: state.tarifs[0].type ?? ''));
                              if(state.paymentEntity.paymentUrl!='') {
                                await launchUrl(Uri.parse(state.paymentEntity.paymentUrl ?? '/'));
                              }
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );
}
