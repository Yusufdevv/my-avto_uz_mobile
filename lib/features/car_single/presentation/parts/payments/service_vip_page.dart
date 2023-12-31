// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/bloc/invoice_bloc/invoice_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/invoice_tarif_item.dart';
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

class ServiceVipPage extends StatefulWidget {
  const ServiceVipPage({
    required this.announcementId,
    required this.date,
    Key? key,
  }) : super(key: key);
  final int announcementId;
  final DateTime date;

  @override
  State<ServiceVipPage> createState() => _ServiceVipPageState();
}

// ignore: prefer_mixin
class _ServiceVipPageState extends State<ServiceVipPage> {
  final ValueNotifier<int> tarifValue = ValueNotifier<int>(0);
  final ValueNotifier<int> paymentValue = ValueNotifier<int>(0);
  late InvoiceBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InvoiceBloc()..add(GetTarifsEvent(tarifType: TarifTypeEnum.vip));
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
              backgroundColor: Theme.of(context)
                  .extension<ThemedColors>()!
                  .scaffoldBackground,
              appBar: WAppBar(
                hasUnderline: true,
                hasBackButton: true,
                underlineColor:
                    Theme.of(context).extension<ThemedColors>()!.divider,
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
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('VIP',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge),
                                      const SizedBox(height: 8),
                                      Text(
                                        LocaleKeys.in_the_VIP_service_you_will
                                            .tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: LightThemeColors
                                                    .darkGreyToWhite),
                                      ),
                                      const SizedBox(height: 16),
                                      ...List.generate(state.tarifs.length,
                                          (index) {
                                        final item = state.tarifs[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 12),
                                          child: ValueListenableBuilder<int>(
                                              valueListenable: tarifValue,
                                              builder: (context, value,
                                                      child) =>
                                                  InvoiceTarifItem(
                                                    tarifDay:
                                                        item.typeInt.toString(),
                                                    amount:
                                                        item.amount.toString(),
                                                    dayColor:
                                                        tarifValue.value ==
                                                                index
                                                            ? null
                                                            : greyText,
                                                    value: index,
                                                    color: tarifValue.value ==
                                                            index
                                                        ? Theme.of(context)
                                                            .extension<
                                                                ThemedColors>()!
                                                            .lavenderBlueToCharcoal
                                                        : Theme.of(context)
                                                            .extension<
                                                                ThemedColors>()!
                                                            .scaffoldBackground,
                                                    groupValue:
                                                        tarifValue.value,
                                                    onTap: (val) {
                                                      tarifValue.value = val;
                                                    },
                                                  )),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .scaffoldBackground,
                                  padding: const EdgeInsets.all(16)
                                      .copyWith(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        LocaleKeys.add_to_ways.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(fontSize: 16),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        LocaleKeys
                                            .you_currently_do_not_have_an_ad
                                            .tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: LightThemeColors
                                                    .darkGreyToWhite),
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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  useRootNavigator: true,
                                                  builder: (context) =>
                                                      const VideoCameraBtsht())
                                              .then((value) async {
                                            if (value != null) {
                                              context.read<InvoiceBloc>().add(
                                                    PickImageEvent(
                                                      source:
                                                          value['image_type'],
                                                      index: value['index'],
                                                    ),
                                                  );
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ValueListenableBuilder<int>(
                                          valueListenable: tarifValue,
                                          builder: (context, value, child) {
                                            final item =
                                                state.tarifs[tarifValue.value];
                                            final date = widget.date.add(
                                                Duration(days: item.typeInt));
                                            return TarifItem(
                                              serviceTitle: 'VIP',
                                              amount: item.amount.toString(),
                                              type: LocaleKeys.for_day.tr(
                                                  args: [
                                                    item.typeInt.toString()
                                                  ]),
                                              id: item.id,
                                              date: DateFormat('dd.MM.y')
                                                  .format(date),
                                            );
                                          }),
                                      const SizedBox(height: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              (index) => ValueListenableBuilder<
                                                      int>(
                                                  valueListenable: paymentValue,
                                                  builder: (context, value,
                                                          child) =>
                                                      SelectPaymentItem(
                                                        onTap: (val) {
                                                          // paymentValue.value = val;
                                                          if (val != 0) {
                                                            context
                                                                .read<
                                                                    ShowPopUpBloc>()
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
                                                        color: paymentValue
                                                                    .value ==
                                                                index
                                                            ? Theme.of(context)
                                                                .extension<
                                                                    ThemedColors>()!
                                                                .lavenderBlueToCharcoal
                                                            : Theme.of(context)
                                                                .extension<
                                                                    ThemedColors>()!
                                                                .whiteToDark,
                                                        iconPath:
                                                            iconPathProviders
                                                                    .values
                                                                    .toList()[
                                                                index],
                                                        borderColor: paymentValue
                                                                    .value ==
                                                                index
                                                            ? purple
                                                            : Theme.of(context)
                                                                .extension<
                                                                    ThemedColors>()!
                                                                .divider,
                                                      )),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                  'tariff_type':
                                      state.tarifs[tarifValue.value].type,
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
