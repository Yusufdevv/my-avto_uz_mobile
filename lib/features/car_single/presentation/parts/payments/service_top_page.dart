// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/bloc/invoice_bloc/invoice_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/payments/invoice_in_progress.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_tarif_item.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/car_single/presentation/widgets/tarif_item.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceTopPage extends StatefulWidget {
  const ServiceTopPage({required this.announcementId, Key? key})
      : super(key: key);
  final int announcementId;

  @override
  State<ServiceTopPage> createState() => _ServiceTopPageState();
}

// ignore: prefer_mixin
class _ServiceTopPageState extends State<ServiceTopPage> {
  final ValueNotifier<int> tarifValue = ValueNotifier<int>(0);
  final ValueNotifier<int> paymentValue = ValueNotifier<int>(0);
  late InvoiceBloc bloc;
  String provider = '';

  @override
  void initState() {
    super.initState();
    bloc = InvoiceBloc()..add(GetTarifsEvent());
  }

  Map<String, String> iconPathProvider = {
    'payme': AppIcons.payme,
    'apelsin': AppIcons.apelsin,
    'click': AppIcons.click,
    'kpay': AppIcons.kpay,
  };

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
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.top.tr(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              LocaleKeys.i_this_service_when_.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: LightThemeColors.darkGreyToWhite),
                            ),
                            const SizedBox(height: 16),
                            ...List.generate(state.tarifs.length, (index) {
                              final item = state.tarifs[index];
                              if (index == 0) {
                                tarifValue.value = item.id;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ValueListenableBuilder<int>(
                                    valueListenable: tarifValue,
                                    builder: (context, value, child) =>
                                        InvoiceTarifItem(
                                          tarifDay: item.typeInt.toString(),
                                          amount: item.amount.toString(),
                                          dayColor: tarifValue.value == item.id
                                              ? null
                                              : greyText,
                                          value: item.id,
                                          color: tarifValue.value == item.id
                                              ? lavanda
                                              : white,
                                          groupValue: tarifValue.value,
                                          onTap: (val) {
                                            tarifValue.value = val;
                                          },
                                        )),
                              );
                            }),
                            const SizedBox(height: 4),
                            const Divider(height: 1),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<int>(
                                valueListenable: tarifValue,
                                builder: (context, value, child) {
                                  final item = state.tarifs.firstWhere(
                                      (e) => e.id == tarifValue.value);
                                  return TarifItem(
                                      amount: item.amount.toString(),
                                      type: LocaleKeys.send_to_top_day.tr(args: [item.typeInt.toString()]),
                                      id: item.id,
                                      date: '');
                                }),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.payment_method.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 12,
                                  children: List.generate(
                                    4,
                                    (index) => ValueListenableBuilder<int>(
                                        valueListenable: paymentValue,
                                        builder: (context, value, child) =>
                                            SelectPaymentItem(
                                              onTap: (val) {
                                                paymentValue.value = val;

                                                // bloc.add(SetProviderEvent(
                                                //     provider:iconPathProvider.keys.toList()[index]));
                                              },
                                              value: index,
                                              groupValue: paymentValue.value,
                                              color: paymentValue.value == index
                                                  ? lavanda
                                                  : borderCircular,
                                              iconPath: iconPathProvider.values
                                                  .toList()[index],
                                              borderColor:
                                                  paymentValue.value == index
                                                      ? purple
                                                      : border,
                                            )),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    WButton(
                      isLoading: state.payStatus.isSubmissionInProgress,
                      text: LocaleKeys.confirm.tr(),
                      margin: const EdgeInsets.all(16).copyWith(
                          bottom: 16 + MediaQuery.of(context).padding.bottom),
                      color: orange,
                      onTap: () async {
                        bloc.add(
                          PayInvoiceEvent(
                            announcement: widget.announcementId,
                            provider: iconPathProvider.keys
                                .toList()[paymentValue.value],
                            tariffType: state.tarifs[tarifValue.value].type,
                            onSucces: (paymentUrl) async {
                              if (!await launchUrl(
                                Uri.parse(paymentUrl),
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch $paymentUrl');
                              }
                              await Navigator.push(
                                context,
                                fade(
                                  page: BlocProvider.value(
                                    value: bloc,
                                    child: const InvoiceInProgress(),
                                  ),
                                ),
                              );
                            },
                            onError: () {},
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );
}
