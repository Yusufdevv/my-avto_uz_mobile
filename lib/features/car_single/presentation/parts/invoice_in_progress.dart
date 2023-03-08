import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/bloc/invoice_bloc/invoice_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_status_widget.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceInProgress extends StatefulWidget {
  const InvoiceInProgress({required this.orderId, Key? key}) : super(key: key);
  final int orderId;

  @override
  State<InvoiceInProgress> createState() => _InvoiceInProgressState();
}

// ignore: prefer_mixin
class _InvoiceInProgressState extends State<InvoiceInProgress>
with  WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('come here');
    switch (state) {
      case AppLifecycleState.resumed:
        print('remused');
        context.read<InvoiceBloc>().add(GetTransactionStatusEvent(
            orderId: widget.orderId, onSucces: () {}, onError: () {}));
        break;
      case AppLifecycleState.inactive:
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
      case AppLifecycleState.detached:
        print('detached');
        break;
    }
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build here');
    return Scaffold(
      appBar: WAppBar(
        hasUnderline: true,
        hasBackButton: true,
        title: LocaleKeys.service.tr(),
      ),
      body: BlocBuilder<InvoiceBloc, InvoiceState>(
        builder: (context, state) {
          if (state.transactionStatus == TransactionStatus.waiting) {
            return InvoiceStatusWidget(
              lottie: 'assets/lottie/waiting.json',
              title: LocaleKeys.payment_pending.tr(),
              secondBtnTitle: LocaleKeys.refresh_the_page.tr(),
              onTapToAds: () {
                Navigator.of(context).pop();
              },
              onTapSecondButton: () {
                context.read<InvoiceBloc>().add(GetTransactionStatusEvent(
                    orderId: widget.orderId, onSucces: () {}, onError: () {}));
              },
              hasSecondButton: true,
            );
          }
          if (state.transactionStatus == TransactionStatus.paid) {
            return InvoiceStatusWidget(
              lottie: 'assets/lottie/succes.json',
              title: LocaleKeys.service_connected_successfully.tr(),
              secondBtnTitle: '',
              onTapToAds: () {
                Navigator.of(context).pop();
              },
              onTapSecondButton: () {},
            );
          }
          if (state.transactionStatus == TransactionStatus.failed) {
            return InvoiceStatusWidget(
              lottie: 'assets/lottie/error.json',
              title: LocaleKeys.cannot_payment.tr(),
              secondBtnTitle: LocaleKeys.return_again.tr(),
              onTapToAds: () {
                Navigator.of(context).pop();
              },
              onTapSecondButton: () {
                context.read<InvoiceBloc>().add(PayInvoiceEvent(
                      announcement: 334,
                      provider: 'payme',
                      tariffType: state.tarifs[0].type ?? '',
                      onSucces: (paymentUrl) async {
                        if (!await launchUrl(
                          Uri.parse(paymentUrl),
                          mode: LaunchMode.externalApplication,
                        )) {
                          throw Exception('Could not launch $paymentUrl');
                        }
                      },
                      onError: () {},
                    ));
              },
              hasSecondButton: true,
            );
          }
          return const Center(child: Text('Xatolik'));
        },
      ));
  }
}
