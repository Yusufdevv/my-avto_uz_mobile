// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/bloc/invoice_bloc/invoice_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/payments/invoice_status_page.dart';
import 'package:auto/features/car_single/presentation/parts/payments/video_camera_btsht.dart';
import 'package:auto/features/car_single/presentation/parts/sts_image_item_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/select_pay_way.dart';
import 'package:auto/features/car_single/presentation/widgets/tarif_item.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceReelsPage extends StatefulWidget {
  const ServiceReelsPage({required this.announcementId, Key? key})
      : super(key: key);
  final int announcementId;

  @override
  State<ServiceReelsPage> createState() => _ServiceReelsPageState();
}

// ignore: prefer_mixin
class _ServiceReelsPageState extends State<ServiceReelsPage> {
  final ValueNotifier<int> tarifValue = ValueNotifier<int>(0);
  final ValueNotifier<int> paymentValue = ValueNotifier<int>(0);
  late InvoiceBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InvoiceBloc()..add(GetTarifsEvent(tarifType: TarifTypeEnum.hot));
  }

  Map<String, String> iconPathProviders = {
    'payme': AppIcons.payme,
    'apelsin': AppIcons.apelsin,
    'click': AppIcons.click,
    'paylov': AppIcons.paylov,
  };

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          child: CustomScreen(
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
                                  LocaleKeys.add_to_ways.tr(),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  LocaleKeys.you_currently_do_not_have_an_ad
                                      .tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color:
                                              LightThemeColors.darkGreyToWhite),
                                ),
                                const SizedBox(height: 16),
                                StsImageItemWidget(
                                  onTapDelete: () {
                                    context.read<InvoiceBloc>().add(
                                        DeleteImageVideoEvent(
                                            path: state.media));
                                  },
                                  height: 116,
                                  width: 104,
                                  title: LocaleKeys.add_foto_video.tr(),
                                  image: state.media,
                                  video: state.video,
                                  onTap: () async {
                                    await showModalBottomSheet<
                                                Map<String, dynamic>>(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const VideoCameraBtsht())
                                        .then((value) {
                                      if (value != null) {
                                        context.read<InvoiceBloc>().add(
                                              PickImageEvent(
                                                source: value['image_type'],
                                                index: value['index'],
                                              ),
                                            );
                                      }
                                    });
                                  },
                                ),
                                const Divider(height: 33),
                                ValueListenableBuilder<int>(
                                    valueListenable: tarifValue,
                                    builder: (context, value, child) {
                                      final item =
                                          state.tarifs[tarifValue.value];
                                      return TarifItem(
                                          serviceTitle:
                                              LocaleKeys.add_to_ways.tr(),
                                          amount: item.amount.toString(),
                                          type: item.typeInt == 0
                                              ? '-'
                                              : LocaleKeys.for_day.tr(args: [
                                                  item.typeInt.toString()
                                                ]),
                                          id: item.id,
                                          date: '-');
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
                                                    // paymentValue.value = val;
                                                    if (val != 0) {
                                                      context
                                                          .read<ShowPopUpBloc>()
                                                          .add(ShowPopUp(
                                                              message: LocaleKeys
                                                                  .this_payment_system_is_currently_unavailable
                                                                  .tr(),
                                                              status: PopStatus
                                                                  .warning));
                                                    }
                                                  },
                                                  value: index,
                                                  groupValue:
                                                      paymentValue.value,
                                                  color: paymentValue.value ==
                                                          index
                                                      ? lavanda
                                                      : borderCircular,
                                                  iconPath: iconPathProviders
                                                      .values
                                                      .toList()[index],
                                                  borderColor:
                                                      paymentValue.value ==
                                                              index
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
                              bottom:
                                  16 + MediaQuery.of(context).padding.bottom),
                          color: orange,
                          onTap: () async {
                            bloc.add(
                              PayInvoiceEvent(
                                params: {
                                  'announcement': widget.announcementId,
                                  'provider': iconPathProviders.keys
                                      .toList()[paymentValue.value],
                                  'redirect_url': '/',
                                  'tariff_type': state.tarifs[0].type,
                                  'reels_file':
                                      await MultipartFile.fromFile(state.media)
                                },
                                announcement: widget.announcementId,
                                onSucces: (paymentUrl) async {
                                  if (!await launchUrl(
                                    Uri.parse(paymentUrl),
                                    mode: LaunchMode.externalApplication,
                                  )) {
                                    throw Exception(
                                        'Could not launch $paymentUrl');
                                  }
                                  await Navigator.push(
                                    context,
                                    fade(
                                      page: BlocProvider.value(
                                        value: bloc,
                                        child: const InvoiceStatusPage(),
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
          ),
        ),
      );
}
